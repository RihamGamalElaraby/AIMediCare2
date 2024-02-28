import 'package:ai_medicare/models/WaterIntakeModel.dart';

abstract class WaterInTake {}

class initialWaterInTake extends WaterInTake {}

class LoadingWaterInTake extends WaterInTake {}

class SuccessWaterInTake extends WaterInTake {
  final WaterInTakeModel? model;
  SuccessWaterInTake(this.model);
}

class FailWaterInTake extends WaterInTake {
  final String error;
  FailWaterInTake(this.error);
}
