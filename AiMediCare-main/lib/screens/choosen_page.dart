import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/authpart/LogIn/login_page.dart';
import 'package:ai_medicare/screens/authpart/signUpAsDoctor/doctor_signup.dart';
import 'package:ai_medicare/screens/authpart/signUpAsPatient/patient_signup.dart';
import 'package:flutter/material.dart';

class ChoosenPage extends StatelessWidget {
  static String id = 'Choosen Page';
  const ChoosenPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Ai MediCare',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff0B1957)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/Authentication-rafiki.png'),
                width: 400,
                height: 400,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "For Whom Would You Like To Sign Up? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xff0B1957,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorSignUP()));
                  },
                  child: const Text(
                    ' A Doctor ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientSignUp()));
                  },
                  child: const Text(
                    ' A Patient ',
                    style: TextStyle(
                      color: Color(0xff0B1957),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do you Have Account? ',
                    style: TextStyle(
                        fontFamily: 'BabasNeue',
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
