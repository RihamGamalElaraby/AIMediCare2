import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/models/loginModelSucses.dart';
import 'package:ai_medicare/screens/authpart/LogIn/loginCubit/LoginStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LogininitalStates());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModelSuccsess? model;
  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLodingState());
    try {
      final response = await DioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        },
      );
      model = LoginModelSuccsess.fromJson(response.data);
      print(model!.data);
      if (model!.status! == 'success') {
        print(model!.data!.user!.role);
        print(model!.data!.user!.email);
        print(model!.data!.user!.name);
        print(model!.data!.user!.role);
        emit(LoginSuccsessState(model));
      } else if (model!.status == 'fail') {
        emit(LoginFailState('fail'));
      } else {
        emit(LoginErrorState("Something went very wrong!"));
      }
    } catch (error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    }
  }
  // LoginModelFail? modelFail;
  // LoginModelSuccsess? modelSuccsess;
  // void userLogin({
  //   required String email,
  //   required String password,
  // }) async {
  //   emit(LoginLodingState());
  //   try {
  //     print('try 1');
  //     final response = await DioHelper.postData(url: LOGIN, data: {
  //       'email': email,
  //       'password': password,
  //     });
  //     modelSuccsess = LoginModelSuccsess.fromJson(response.data);
  //     if (response.statusCode == 200 || modelSuccsess!.status == 'success') {
  //       print(modelSuccsess!.token);
  //       emit(LoginSuccsessState(modelSuccsess));
  //     } else if ((response.statusCode == 401 || modelFail!.status == 'fail')) {
  //       modelFail = LoginModelFail.fromJson(response.data);
  //       print(modelFail!.message);
  //       emit(LoginFailState(modelFail));
  //     }
  //   } catch (error) {
  //     print(error.toString());
  //     emit(LoginErrorState(error.toString()));
  //   }
  // }
}
