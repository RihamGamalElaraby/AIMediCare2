import 'package:ai_medicare/models/BmrModel.dart';

abstract class BmrStates {}

class initialBMR extends BmrStates {}

class LoadingBMR extends BmrStates {}

class SuccessBMR extends BmrStates {
  final BmrModel? model;
  SuccessBMR(this.model);
}

class FailBMR extends BmrStates {
  final String error;
  FailBMR(this.error);
}
