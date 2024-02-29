import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/widgets/cards.dart';
import 'package:flutter/material.dart';

class HealthCalcuPage extends StatefulWidget {
  static String id = 'HealthCalcuPage';

  const HealthCalcuPage({super.key});

  @override
  State<HealthCalcuPage> createState() => _HealthCalcuPageState();
}

class _HealthCalcuPageState extends State<HealthCalcuPage> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          // Color.fromARGB(255, 13, 91, 201),
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
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5],
              colors: [
                Color.fromARGB(197, 127, 181, 207),
                Color.fromARGB(255, 13, 91, 201),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(),
                height: height * 0.1,
                width: width,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                  left: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Health Calculator',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20.0,
                          children: <Widget>[
                            SizedBox(
                                width: 150,
                                height: 200.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'BmiPage',
                                    arguments: [token, role],
                                    image: 'assets/bmi.png',
                                    text: 'BMI')),
                            SizedBox(
                                width: 150,
                                height: 200.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'BmrPage',
                                    arguments: [token, role],
                                    image: 'assets/calories.png',
                                    text: 'BMR')),
                            SizedBox(
                                width: 150,
                                height: 200.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'WaterIntakePage',
                                    arguments: [token, role],
                                    image: 'assets/water-bottle.png',
                                    text: 'Water Intake')),
                            SizedBox(
                                width: 150,
                                height: 200.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'BodyFatPage',
                                    arguments: [token, role],
                                    image: 'assets/slim-body.png',
                                    text: 'Body Fat')),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
