import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';

class HeartAttackPage extends StatelessWidget {
  static String id = 'HeartAttackPage';

  const HeartAttackPage({super.key});

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
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Heart Attack Prediction',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text('Fill below details to predict heart attack'),
            ),
            smallTextField(
              hinttext: 'Ejection Fraction (eg.25,30,60,etc)',
            ),
            smallTextField(
              hinttext: 'Platelets (eg.351000.00,176000.00,etc)',
            ),
            smallTextField(hinttext: 'Serum Creatinine (eg.0.80,150,etc)'),
            smallTextField(hinttext: 'Time (eg.8,45,205,etc)'),
            showDialgButton(
                buttonText: 'PREDICT',
                title: 'THE RESULT',
                context: context,
                content: ''),
          ],
        ),
      ),
    );
  }
}
