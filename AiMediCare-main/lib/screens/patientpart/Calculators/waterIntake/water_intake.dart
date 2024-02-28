import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/waterIntake/cubit/WaterIntakeCubit.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/waterIntake/cubit/WaterIntakeStates.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterIntakePage extends StatelessWidget {
  static String id = 'WaterIntakePage';
  var formKey = GlobalKey<FormState>();
  List<String> items2 = [
    'sedentary',
    'lightly active',
    'moderately active',
    'very active',
    'extra active',
  ];
  String? activityControler;

  var weightController = TextEditingController();

  WaterIntakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WaterInTakeCubit, WaterInTake>(
        listener: (context, state) => {},
        builder: (context, state) {
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
                  'WATER INTAKE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            body: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallTextField(
                      hinttext: 'weight',
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
                          double? weightvalue =
                              double.tryParse(weightController.text);
                          if (CacheHelper.getData(key: 'token') != null) {
                            WaterInTakeCubit.get(context)
                                .postWater(
                                    weightvalue,
                                    activityControler.toString(),
                                    CacheHelper.getData(key: 'token'))
                                .then((value) {
                              if (WaterInTakeCubit.get(context).model != null) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Result'),
                                      content: Text(
                                          'WaterInTake: ${WaterInTakeCubit.get(context).model!.waterIntake!.value!}. \n describtion:  ${WaterInTakeCubit.get(context).model!.waterIntake!.description!} \n unit:  ${WaterInTakeCubit.get(context).model!.waterIntake!.unit} '),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Done'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }).catchError((error) {});
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
                          Text('Calculate Water In Take'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
