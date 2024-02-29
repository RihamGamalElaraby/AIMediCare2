import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMI/cubit/BmiCubit.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMI/cubit/BmiStates.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiPage extends StatelessWidget {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  static String id = 'BmiPage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit, BmiStates>(
      listener: (context, state) {
        if (state is BmiGetDataSuccssesState) {
          if (state.model != null) {
            if (state.model!.weightStatus != null && state.model!.bMI != null) {
              print(state.model!.weightStatus);
              print(state.model!.bMI);
            } else {
              print("Weight status or BMI is null");
            }
          } else {
            print("Model data is null");
          }
        }
      },
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
                'BMI',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  smallTextField(
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
                      hinttext: 'height (eg. 160cm,170cm,etc)'),
                  smallTextField(
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
                      hinttext: 'weight (eg. 50kg,60kg,etc)'),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        double? heightValue =
                            double.tryParse(heightController.text);
                        double? weightValue =
                            double.tryParse(weightController.text);
                        if (CacheHelper.getData(key: 'token') != null) {
                          print('Token: ${CacheHelper.getData(key: "token")}');
                          print(
                              'Headers: { "Content-Type": "application/json", "Authorization": "Bearer ${CacheHelper.getData(key: "token")}" }');
                          print(
                              'Parameters: { "height": $heightValue, "weight": $weightValue }');
                          BmiCubit.get(context)
                              .postBmi(weightValue, heightValue,
                                  CacheHelper.getData(key: 'token'))
                              .then((value) {
                            if (BmiCubit.get(context).model != null) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(BmiCubit.get(context)
                                        .model!
                                        .weightStatus!),
                                    content: Text(
                                        'BMI: ${BmiCubit.get(context).model!.bMI}'),
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
                        Text('Calculate BMI'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
