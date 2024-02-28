import 'package:flutter/material.dart';

Widget smallTextField({
  required String hinttext,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) =>
    Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hinttext,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 234, 225, 225),
                ),
              ),
            )));

Widget showDialgButton(
        {required String buttonText,
        required String title,
        VoidCallback? onPressed,
        required BuildContext context,
        required String content}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightBlue,
          ),
          child: MaterialButton(
            onPressed: onPressed,
            // () {
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(
            //         contentPadding: const EdgeInsets.all(80),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20)),
            //         title: Text(title),
            //         content: Text(content),
            //         actions: [
            //           TextButton(
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //               child: const Text('Ok'))
            //         ],
            //       );
            //     });
            // },
            child: Center(
                child: Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            )),
          )),
    );
