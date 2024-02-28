import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/widgets/textt2.dart';
import 'package:flutter/material.dart';

class BreastCancerPage extends StatelessWidget {
  static String id = 'BreastCancerPage';

  const BreastCancerPage({super.key});

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
            'Breast Cancer Prediction',
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
              child: Text('Fill below form to predict breast cancer :'),
            ),
            smallTextField(
              hinttext: 'Radius Mean (eg.14.02,11.13,etc)',
            ),
            smallTextField(
              hinttext: 'Texture Mean (eg.20.35,16.32,etc)',
            ),
            smallTextField(
                hinttext: 'compactness Mean (eg.0.11260,0.11361,etc)'),
            smallTextField(
                hinttext: 'Concavity Mean (eg.0.111400,0.09961,etc)'),
            smallTextField(
              hinttext: 'Perimeter Mean (eg.91.34,127.35,etc)',
            ),
            smallTextField(
              hinttext: 'Area Mean (eg.500.23,2010.21,etc)',
            ),
            smallTextField(
                hinttext: 'Smoothnees Mean (eg.0.08151,0.12254,etc)'),
            smallTextField(hinttext: 'Concave Point Mean (eg.0.043040,etc)'),
            smallTextField(hinttext: 'Symmetry Mean(eg.0.1537,0.2251,etc)'),
            smallTextField(hinttext: 'Fractal Dimension (eg.0.06171,etc)'),
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
