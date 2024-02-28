import 'package:ai_medicare/models/BodyFatModel.dart';

abstract class BodyFats {}

class initialBodyFats extends BodyFats {}

class LoadingBodyFats extends BodyFats {}

class SuccessBodyFats extends BodyFats {
  final BodyFatModel? model;
  SuccessBodyFats(this.model);
}

class FailBodyFats extends BodyFats {
  final String error;
  FailBodyFats(this.error);
}
