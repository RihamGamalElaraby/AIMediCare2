import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/doctorpart/investigations/docMain_page.dart';
import 'package:ai_medicare/screens/authpart/signUpAsDoctor/cubit/signUpAsDoctorCubit.dart';
import 'package:ai_medicare/screens/authpart/signUpAsDoctor/cubit/signUpDoctotStates.dart';
import 'package:ai_medicare/widgets/custom_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZGNjYjQ3OTYwZTlkNzZiZGEzOTM0NSIsImlhdCI6MTcwODk2ODc3NywiZXhwIjoxNzE2NzQ0Nzc3fQ.rpQJyyeB-nuaMXmVcVa8D6vgPvPMU1uPQyQRDSMQav4
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZGRlNTljZTE4ODU4ZGRmNzFkOGNhNiIsImlhdCI6MTcwOTA0MTA1NSwiZXhwIjoxNzE2ODE3MDU1fQ.4EZ1HFfv-47rv04UK_MnMg_vErPvOZwH5J9-qetETlo
class DoctorSignUP extends StatelessWidget {
  static String id = 'Doctor SignUp Page';
  bool ispassword = true;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwarController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  DoctorSignUP({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpAsDoctorCubit, SignUpDoctorStates>(
        listener: (context, state) {
      if (state is SignUpFailState || state is SignUpErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(state is SignUpFailState
                  ? state.message
                  : 'Something went wrong!')),
        );
      } else if (state is SignUpSuccessState) {
        CacheHelper.saveData(key: 'token', value: state.signUpDoctorModel.token)
            .then((value) {
          token = state.signUpDoctorModel.token ?? '';
          print(state.signUpDoctorModel.data!.user!.email);
          print(token);
          print(state.signUpDoctorModel.data!.user!.role);
          Navigator.pushReplacementNamed(
            context,
            'DoctorMain page',
            arguments: [token, role],
          );
        });
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Icon Logo
                    SizedBox(
                      height: 220,
                      width: 600,
                      child: Image.asset('assets/AI MEDICARE 2.png'),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    //greeting text

                    const Text('Welcome DOC!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0B1957),
                        )),

                    const SizedBox(
                      height: 30,
                    ),
                    //user name text field
                    customTextField(
                      obscureText: false,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Username';
                        }
                        return null;
                      },
                      hinttext: 'UserName',
                      icon: const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    //login button
                    const SizedBox(
                      height: 20.0,
                    ),
                    //email text field
                    customTextField(
                      obscureText: false,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      hinttext: 'Email',
                      icon: const Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    //password text field
                    customTextField(
                        obscureText: ispassword,
                        controller: passwarController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        hinttext: 'Password',
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: ispassword
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                ),
                        )),
                    //login button
                    const SizedBox(
                      height: 20.0,
                    ),
                    customTextField(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value != passwarController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: ispassword,
                        hinttext: 'Confirm Password',
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: ispassword
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                ),
                        )),
                    //login button
                    const SizedBox(
                      height: 20.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! SignUpLoadingState,
                      builder: (context) => customtext2(
                        text: 'Sign Up',
                        context: context,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            SignUpAsDoctorCubit.get(context).SignUpAsDoctor(
                              username: nameController.text,
                              email: emailController.text,
                              password: passwarController.text,
                              confirmPassword: confirmPasswordController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) => const CircularProgressIndicator(),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorMainPage()));
                      },
                      child: const Text(
                        'Forget Your Password? ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
