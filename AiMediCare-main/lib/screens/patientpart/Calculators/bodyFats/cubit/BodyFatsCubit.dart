import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/models/BodyFatModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BodyFatsState.dart';

class BodyFatsCubit extends Cubit<BodyFats> {
  BodyFatsCubit() : super(initialBodyFats());
  static BodyFatsCubit get(context) => BlocProvider.of(context);

  BodyFatModel? model;
  Future<void> postBodyFats(
    String gender,
    double? hieght,
    int? age,
    double? weight,
    String token,
  ) async {
    emit(LoadingBodyFats());
    try {
      final response = await DioHelper.postData(
        url: 'https://ai-medicare-2.onrender.com/api/patients/bodyFat',
        data: {
          "gender": gender,
          "weight": weight,
          "height": hieght,
          "age": age,
        },
        token: token,
      );

      if (response.statusCode == 200) {
        model = BodyFatModel.fromJson(response.data);
        emit(SuccessBodyFats(model));
      } else {
        print('Error: ${response.statusCode} ${response.statusMessage}');
        emit(FailBodyFats('Failed to calculate BMR'));
      }
    } catch (e) {
      print(e.toString());
      emit(FailBodyFats(e.toString()));
    }
  }
}
