import 'package:ai_medicare/models/SymptomsModel.dart';

abstract class SyptomsStates {}

class initialSyptoms extends SyptomsStates {}

class LoadingSyptoms extends SyptomsStates {}

class SuccessSyptoms extends SyptomsStates {
  final SymptomsModel? model;
  SuccessSyptoms(this.model);
}

class FailSyptoms extends SyptomsStates {
  final String error;
  FailSyptoms(this.error);
}
