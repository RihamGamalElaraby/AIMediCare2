import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class NearestHospitalsPge extends StatefulWidget {
  static String id = 'NearestHospitalsPge';

  const NearestHospitalsPge({super.key});

  @override
  State<NearestHospitalsPge> createState() => _NearestHospitalsPgeState();
}

class _NearestHospitalsPgeState extends State<NearestHospitalsPge> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(
        scheme: "https",
        host: 'www.google.com',
        path: '/maps/search/hospitals');
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

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
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 120, left: 20),
            child: Text(
              'Nearest Hospitals Neaded?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Center(
            child: Column(
              children: [
                const Text(
                  'just hold to Search ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    _launchURL("https://www.google.com/maps/search/hospitals");
                  },
                  child: Lottie.asset('assets/Animation - 1708545679983.json',
                      height: 280),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
