import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/models/signUpAsDoctorModel.dart';
import 'package:ai_medicare/screens/authpart/signUpAsDoctor/cubit/signUpDoctotStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Update SignUpAsDoctorCubit

class SignUpAsDoctorCubit extends Cubit<SignUpDoctorStates> {
  SignUpAsDoctorCubit() : super(initialState());

  static SignUpAsDoctorCubit get(context) =>
      BlocProvider.of(context, listen: false);

  void SignUpAsDoctor({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoadingState());
    try {
      final response = await DioHelper.postData(
        url: SIGNUPASDOCTOR,
        data: {
          'name': username,
          'email': email,
          'password': password,
          'passwordConfirm': confirmPassword,
        },
      );
      final signUpDoctorModel = SignUpDoctorModel.fromJson(response.data);
      print(signUpDoctorModel.data);
      if (signUpDoctorModel.status == 'success') {
        emit(SignUpSuccessState(signUpDoctorModel));
      } else if (signUpDoctorModel.status == 'fail') {
        emit(SignUpFailState(signUpDoctorModel.message!));
      } else {
        emit(SignUpErrorState("Something went very wrong!"));
      }
    } catch (error) {
      print(error.toString());
      emit(SignUpErrorState(error.toString()));
    }
  }
}

// Update SignUpPatientStates

