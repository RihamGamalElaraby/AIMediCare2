import 'package:ai_medicare/Network/dio.helper.dart'; // Adjust import path as needed
import 'package:ai_medicare/models/BMImodel.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMI/cubit/BmiStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(BmiInitialState());

  static BmiCubit get(context) => BlocProvider.of(context);
  BMImodel? model;
  Future<void> postBmi(double? weight, double? height, String token) async {
    emit(BmiGetDataLoadingState());
    try {
      final response = await DioHelper.postData(
        url: 'https://ai-medicare-2.onrender.com/api/patients/bmi',
        data: {'weight': weight, 'height': height},
        token: token,
      );
      if (response.statusCode == 200) {
        model = BMImodel.fromJson(response.data);
        emit(BmiGetDataSuccssesState(model));
      } else {
        print(model!.messege!);
        print(response.statusMessage);
        emit(BmiGetDataerrorState('Failed to calculate BMI'));
      }
    } catch (e) {
      print(e.toString());

      print('messae ${model!.messege!}');
      emit(BmiGetDataerrorState('An error occurred: $e'));
    }
  }
}



//   Future<void> getBmi(double height, double weight, String token) async {
//   try {
//     final response = await dio.get(
//       BMI,
//       queryParameters: {'weight': weight, 'height': height},
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       ),
//     );
//     // ...
//   } catch (e) {
//     // ...
//   }
// }

  // BMImodel? model;
// Future<void> getBmi(double height, double weight, String token) async {
  //   emit(BmiGetDataLoadingState());
  //   DioHelper.getData(path: BMI, query: {
  //     'weight': weight,
  //     'height': height,
  //     'token': token,
  //   }).then((value) {
  //     model = BMImodel.fromJson(value.data);
  //     emit(BmiGetDataSuccssesState(model));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(BmiGetDataerrorState(error.toString()));
  //   });
  // }

//   static Future<void> getBMI(
//       {required double weight, required double height}) async {
//     final response = await DioHelper.getData(
//       path: '/api/patients/bmi',
//       query: {'weight': weight.toString(), 'height': height.toString()},
//     );

//     // Extract BMI from the response
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = response.data;
//       final double bmi = responseData['bmi'];
//       // return bmi;
//     } else {
//       throw Exception('Failed to get BMI');
//     }
//   }
// }


//  void getCategoryData() {
//     DioHelper.getData(
//       path: GETCATEGORIES,
//       token: token,
//     ).then((value) {
//       categoriesModel = CategoriesModel.fromJson(value.data);

//     }).catchError((error) {
//       print(error.toString());
//       emit(SuperFailureCategoriesDataState(error));
//     });
//   }