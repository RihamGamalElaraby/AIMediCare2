import 'package:ai_medicare/models/signUpAsDoctorModel.dart';

abstract class SignUpDoctorStates {}

class initialState extends SignUpDoctorStates {}

class SignUpLoadingState extends SignUpDoctorStates {}

class SignUpSuccessState extends SignUpDoctorStates {
  final SignUpDoctorModel signUpDoctorModel;
  SignUpSuccessState(this.signUpDoctorModel);
}

class SignUpFailState extends SignUpDoctorStates {
  final String message;
  SignUpFailState(this.message);
}

class SignUpErrorState extends SignUpDoctorStates {
  final String error;
  SignUpErrorState(this.error);
}
