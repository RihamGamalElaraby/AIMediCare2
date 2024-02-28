import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/models/WaterIntakeModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'WaterIntakeStates.dart';

class WaterInTakeCubit extends Cubit<WaterInTake> {
  WaterInTakeCubit() : super(initialWaterInTake());
  static WaterInTakeCubit get(context) => BlocProvider.of(context);

  WaterInTakeModel? model;
  Future<void> postWater(
    double? weight,
    String activityLevel,
    String token,
  ) async {
    emit(LoadingWaterInTake());
    try {
      final response = await DioHelper.postData(
        url: 'https://ai-medicare-2.onrender.com/api/patients/waterIntake',
        data: {
          "weight": weight,
          "activityLevel": activityLevel,
        },
        token: token,
      );

      if (response.statusCode == 200) {
        model = WaterInTakeModel.fromJson(response.data);
        emit(SuccessWaterInTake(model));
      } else {
        print('Error: ${response.statusCode} ${response.statusMessage}');
        emit(FailWaterInTake('Failed to calculate BMR'));
      }
    } catch (e) {
      print(e.toString());
      emit(FailWaterInTake(e.toString()));
    }
  }
}
