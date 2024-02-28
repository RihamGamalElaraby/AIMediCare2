import 'package:ai_medicare/models/BMImodel.dart';

abstract class BmiStates {}

class BmiInitialState extends BmiStates {}

class BmiGetDataLoadingState extends BmiStates {}

class BmiGetDataSuccssesState extends BmiStates {
  final BMImodel? model;
  BmiGetDataSuccssesState(this.model);
}

class BmiGetDataerrorState extends BmiStates {
  final String error;
  BmiGetDataerrorState(this.error);
}
