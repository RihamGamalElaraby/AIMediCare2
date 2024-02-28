import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BrainTumerPage extends StatelessWidget {
  static String id = 'BrainTumerPage';

  const BrainTumerPage({super.key});

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
        backgroundColor: Colors.lightBlue,
        title: const Center(
          child: Text(
            'BrainTumer Detection',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () {},
                child: Lottie.asset('assets/Animation - 1707828745411.json',
                    width: 300, height: 300),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Click and Point Your Phone in MIR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('OR Drop Files Here :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 30,
            ),
            customtext2(
              text: 'Choose File', context: context,
              //  nav: DoctorMainPage()
            )
          ],
        ),
      ),
    );
  }
}
