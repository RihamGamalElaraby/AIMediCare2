import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/models/BmrModel.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMR/cubit/BMRstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmrCubit extends Cubit<BmrStates> {
  BmrCubit() : super(initialBMR());
  static BmrCubit get(context) => BlocProvider.of(context);

  BmrModel? model;
  Future<void> postBmr(
    double? hieght,
    double? weight,
    int? age,
    String gender,
    String activityLevel,
    String token,
  ) async {
    emit(LoadingBMR());
    try {
      final response = await DioHelper.postData(
        url: 'https://ai-medicare-2.onrender.com/api/patients/bmr',
        data: {
          "age": age,
          "gender": gender,
          "weight": weight?.round(), // Round weight to integer
          "height": hieght?.round(),
          "activityLevel": activityLevel,
        },
        token: token,
      );

      if (response.statusCode == 200) {
        model = BmrModel.fromJson(response.data);
        emit(SuccessBMR(model));
      } else {
        print('Error: ${response.statusCode} ${response.statusMessage}');
        emit(FailBMR('Failed to calculate BMR'));
      }
    } catch (e) {
      print(e.toString());
      emit(FailBMR(e.toString()));
    }
  }

  // BmrModel? model;
  // void getBmi({
  //   required int hieght,
  //   required int weight,
  //   required int age,
  //   required String gender,
  //   required String activityLevel,
  // }) async {
  //   emit(LoadingBMR());
  //   DioHelper.getData(path: BMR, query: {
  //     'weight': weight,
  //     'height': hieght,
  //     'age': age,
  //     'gender': gender,
  //     'activityLevel': activityLevel,
  //   }).then((value) {
  //     model = BmrModel.fromJson(value.data);
  //     emit(SuccessBMR());
  //   }).catchError((error) {
  //     emit(FailBMR(error.toString()));
  //   });
  // }
}
