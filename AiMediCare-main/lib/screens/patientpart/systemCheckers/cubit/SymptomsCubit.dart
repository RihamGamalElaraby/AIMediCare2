import 'package:ai_medicare/Network/dio.Helper.dart';
import 'package:ai_medicare/models/SymptomsModel.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/cubit/SymptomsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyptomsCubit extends Cubit<SyptomsStates> {
  SyptomsCubit() : super(initialSyptoms());
  static SyptomsCubit get(context) => BlocProvider.of(context);

  List<Symptoms> allSymptoms = [];
  List<Symptoms> selectedSymptoms = [];
  SymptomsModel? model;

  List<Map<String, dynamic>> getSymptomsNameIdMap() {
    return allSymptoms
        .map((symptom) => {'id': symptom.iD, 'name': symptom.name})
        .toList();
  }

  Future<void> getSymptoms(String token) async {
    emit(LoadingSyptoms());
    try {
      final response = await DioHelper.getData(
        path: 'https://ai-medicare-2.onrender.com/api/patients/symptoms',
        token: token,
      );

      if (response.statusCode == 200) {
        model = SymptomsModel.fromJson(response.data);
        allSymptoms = model!.symptoms!;

        print(model!.status);
        print(model!.symptoms!.length);
        print(allSymptoms.length);
        print(allSymptoms.first.name);

        emit(SuccessSyptoms(model));
      } else {
        print('Error: ${response.statusCode} ${response.statusMessage}');
        emit(FailSyptoms('Failed to calculate BMR'));
      }
    } catch (e) {
      print(e.toString());
      emit(FailSyptoms(e.toString()));
    }
  }

  void toggleSelection(Symptoms symptom) {
    if (selectedSymptoms.contains(symptom)) {
      selectedSymptoms.remove(symptom);
    } else {
      selectedSymptoms.add(symptom);
    }
  }
}
