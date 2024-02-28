import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/cubit/SymptomsCubit.dart';
import 'package:ai_medicare/screens/patientpart/systemCheckers/cubit/SymptomsStates.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect/multiselect.dart';

class SymptomsCheckerPage extends StatelessWidget {
  static String id = 'SymptomsCheckerPage';
  var ageContoller = TextEditingController();
  String? genderController;
  var formKey = GlobalKey<FormState>();
  List<String> items = ['male', 'female'];

  SymptomsCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SyptomsCubit>(
      create: (context) =>
          SyptomsCubit()..getSymptoms(CacheHelper.getData(key: 'token')),
      child: BlocConsumer<SyptomsCubit, SyptomsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () async {
                        CacheHelper.clearData().then((value) {
                          Navigator.pushReplacementNamed(
                              context, 'Welcome Page');
                        });
                        print(token);
                        print(role);
                        print('loggedout');
                      },
                      icon: Icon(Icons.logout))
                ],
                backgroundColor: Colors.lightBlue,
                title: const Center(
                  child: Text(
                    'SymptomsChecker',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        hint: Text('gender'),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        items: items
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          genderController = val as String?;
                        },
                        value: genderController,
                      ),
                    ),
                  ),
                  smallTextField(
                    hinttext: 'Age (eg. 20,25)',
                    controller: ageContoller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a age';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    child: Center(
                      child: DropDownMultiSelect(
                        hint: Text('symptoms'),
                        icon: Icon(Icons.domain_verification_rounded),
                        options: SyptomsCubit.get(context)
                            .allSymptoms
                            .map((symptom) => DropdownMenuItem(
                                  value: symptom.iD,
                                  child: Text(symptom.name!),
                                ))
                            .toList(),
                        selectedValues: SyptomsCubit.get(context)
                            .selectedSymptoms
                            .map((e) => e.iD)
                            .toList(),
                        onChanged: (value) {
                          SyptomsCubit.get(context).selectedSymptoms = value
                              .map((e) => SyptomsCubit.get(context)
                                  .allSymptoms
                                  .firstWhere((s) => s.iD == e))
                              .toList();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
