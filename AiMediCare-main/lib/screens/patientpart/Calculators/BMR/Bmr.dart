import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMR/cubit/BMRcubit.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMR/cubit/BMRstates.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmrPage extends StatelessWidget {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var ageContoller = TextEditingController();
  String? genderController;
  var formKey = GlobalKey<FormState>();
  List<String> items = ['male', 'female'];
  // sedentary | lightly active | moderately active | very active | extra active
  String? activityControler;

  List<String> items2 = [
    'sedentary',
    'lightly active',
    'moderately active',
    'very active',
    'extra active',
  ];
  BmrPage({super.key});
  static String id = 'BmrPage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmrCubit, BmrStates>(listener: (context, state) {
      if (state is SuccessBMR) {
        if (state.model != null) {
          if (state.model!.bmr != null && state.model!.tdee != null) {
            print(state.model!.bmr);
            print(state.model!.tdee);
          } else {
            print("Weight status or BMR is null");
          }
        } else {
          print("Model data is null");
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  CacheHelper.clearData().then((value) {
                    Navigator.pushReplacementNamed(context, 'Welcome Page');
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
              'BMR',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
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
                  smallTextField(
                    hinttext: 'height (eg. 160cm,170cm,etc)',
                    controller: heightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a height';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  smallTextField(
                    hinttext: 'weight (eg. 50kg,60kg,etc)',
                    controller: weightController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a weight';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
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
                        hint: Text('activity level'),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        items: items2
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          activityControler = val as String?;
                        },
                        value: activityControler,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        double? heightValue =
                            double.tryParse(heightController.text);
                        int? ageValue = int.tryParse(ageContoller.text);
                        double? weightValue =
                            double.tryParse(weightController.text);

                        if (CacheHelper.getData(key: 'token') != null) {
                          // Ensure height, weight, and age values are not null
                          if (heightValue != null &&
                              weightValue != null &&
                              ageValue != null) {
                            BmrCubit.get(context)
                                .postBmr(
                              heightValue,
                              weightValue,
                              ageValue,
                              genderController ??
                                  '', // Handle null case for genderController
                              activityControler ??
                                  '', // Handle null case for activityControler
                              CacheHelper.getData(key: 'token') ?? '',
                            )
                                .then((value) {
                              if (BmrCubit.get(context).model != null) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Result',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'BMR: ${BmrCubit.get(context).model!.bmr!.value!}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            'BMR Description:  ${BmrCubit.get(context).model!.bmr!.description!}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            'TDEE:  ${BmrCubit.get(context).model!.tdee!.value!}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            'TDEE Description:  ${BmrCubit.get(context).model!.tdee!.description!}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Done',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }).catchError((error) {});
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calculate),
                        SizedBox(width: 10),
                        Text('Calculate BMR'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
