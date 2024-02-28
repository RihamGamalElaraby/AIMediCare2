import 'package:ai_medicare/models/loginModelSucses.dart';

abstract class LoginStates {}

class LogininitalStates extends LoginStates {}

class LoginSuccsessState extends LoginStates {
  final LoginModelSuccsess? model;
  LoginSuccsessState(this.model);
}

class LoginLodingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginFailState extends LoginStates {
  final String message;
  LoginFailState(this.message);
  // LoginModelSuccsess? model;
  // // final LoginModelFail? model;
  // LoginFailState(this.model);
}
