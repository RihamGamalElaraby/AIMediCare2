import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/models/signUpAsPatientModel.dart';
import 'package:ai_medicare/screens/authpart/signUpAsPatient/cubit/signUpAsPatientStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Update SignUpAsPatientCubit

class SignUpAsPatientCubit extends Cubit<SignUpPatientStates> {
  SignUpAsPatientCubit() : super(initialStatePattent());

  static SignUpAsPatientCubit get(context) =>
      BlocProvider.of(context, listen: false);

  void SignUpAsPatient({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpPatientLoadingState());
    try {
      final response = await DioHelper.postData(
        url: SIGNUPASPATIENT,
        data: {
          'name': username,
          'email': email,
          'password': password,
          'passwordConfirm': confirmPassword,
        },
      );
      final signUpPatientModel = SignUpPatientModel.fromJson(response.data);
      print(signUpPatientModel.data);
      print(signUpPatientModel.token);
      print(signUpPatientModel.data!.user!.role);
      if (signUpPatientModel.status == 'success') {
        emit(SignUpPatientSuccessState(signUpPatientModel));
      } else if (signUpPatientModel.status == 'fail') {
        emit(SignUpPatientFailState(signUpPatientModel.message!));
      } else {
        emit(SignUpPatientErrorState("Something went very wrong!"));
      }
    } catch (error) {
      print(error.toString());
      emit(SignUpPatientErrorState(error.toString()));
    }
  }
}

// Update SignUpPatientStates

