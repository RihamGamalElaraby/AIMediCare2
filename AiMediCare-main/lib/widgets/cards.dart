import 'package:flutter/material.dart';

Widget defultCard(
        {required Color color,
        required BuildContext context,
        required String nav,
        required String image,
        List<Object> arguments = const [],
        required String text}) =>
    Card(
      color: color,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, nav, arguments: arguments);
        },
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                image,
                width: 60.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
            ],
          ),
        )),
      ),
    );
