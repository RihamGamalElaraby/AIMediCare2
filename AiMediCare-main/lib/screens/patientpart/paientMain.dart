import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/cubit/cubit.dart';
import 'package:ai_medicare/cubit/states.dart';
import 'package:ai_medicare/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaientMainPage extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  static String id = 'PaientMain page';
  var height, width;

  PaientMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<generalCubit, generarStates>(
        listener: (context, state) {
      if (state is generalInitialState) {
        print(token);
        print(role);
      }
    }, builder: (context, state) {
      return Scaffold(
        key: scaffoldKey,
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
              Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                  left: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Paient',
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
                                width: 180.0,
                                height: 230.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'SymptomsCheckerPage',
                                    arguments: [token, role],
                                    image: 'assets/symptoms.png',
                                    text: 'Symptoms Checker')),
                            SizedBox(
                                width: 180.0,
                                height: 230.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'HealthCalcuPage',
                                    arguments: [token, role],
                                    image: 'assets/health-check.png',
                                    text: 'Health Calculators')),
                            SizedBox(
                                width: 180.0,
                                height: 240.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'SosPage',
                                    arguments: [token, role],
                                    image: 'assets/emergency-call.png',
                                    text: 'Emergancy Call')),
                            SizedBox(
                                width: 180.0,
                                height: 240.0,
                                child: defultCard(
                                    color: const Color(0xff9ECCFA),
                                    context: context,
                                    nav: 'NearestHospitalsPge',
                                    arguments: [token, role],
                                    image: 'assets/location.png',
                                    text: 'Nearest Hospitals')),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            scaffoldKey.currentState?.showBottomSheet((context) => Container(
                  height: 550,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Image.asset('assets/medical-team_1.png',
                            width: double.infinity, height: 250),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          'Now You Can Use Our Site ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(197, 127, 181, 207),
                                Color.fromARGB(255, 13, 91, 201),
                              ],
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: const Text(
                              'LET\'S START NOW',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
          backgroundColor: Colors.blue,
          label: const Text(
            'Our Site',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          icon: const Icon(
            Icons.web_outlined,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
