import 'package:ai_medicare/models/signUpAsPatientModel.dart';

abstract class SignUpPatientStates {}

class initialStatePattent extends SignUpPatientStates {}

class SignUpPatientLoadingState extends SignUpPatientStates {}

class SignUpPatientSuccessState extends SignUpPatientStates {
  final SignUpPatientModel signUpPatientModel;
  SignUpPatientSuccessState(this.signUpPatientModel);
}

class SignUpPatientFailState extends SignUpPatientStates {
  final String message;
  SignUpPatientFailState(this.message);
}

class SignUpPatientErrorState extends SignUpPatientStates {
  final String error;
  SignUpPatientErrorState(this.error);
}
