import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/choosen_page.dart';
import 'package:ai_medicare/screens/authpart/signUpAsPatient/cubit/signUpAsPatientCubit.dart';
import 'package:ai_medicare/screens/authpart/signUpAsPatient/cubit/signUpAsPatientStates.dart';
import 'package:ai_medicare/widgets/custom_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientSignUp extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwarController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  static String id = 'Patient SignUp Page';
  bool ispassword = true;

  PatientSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpAsPatientCubit, SignUpPatientStates>(
      listener: (context, state) {
        if (state is SignUpPatientFailState ||
            state is SignUpPatientErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state is SignUpPatientFailState
                    ? state.message
                    : 'Something went wrong!')),
          );
        } else if (state is SignUpPatientSuccessState) {
          CacheHelper.saveData(
              key: 'role', value: state.signUpPatientModel.data!.user!.role);
          CacheHelper.saveData(
                  key: 'token', value: state.signUpPatientModel.token)
              .then((value) {
            token = state.signUpPatientModel.token ?? '';
            print(state.signUpPatientModel.data!.user!.email);
            print(token);
            print(state.signUpPatientModel.data!.user!.role);
            Navigator.pushReplacementNamed(context, 'PaientMain page',
                arguments: [token, role]);
          });
        }
      },
      builder: (context, state) {
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
                      SizedBox(
                        height: 220,
                        width: 600,
                        child: Image.asset('assets/AI MEDICARE 2.png'),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text('Welcome Patient!',
                          style: TextStyle(
                            fontFamily: 'BabasNeue',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0B1957),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      customTextField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Username';
                          }
                          return null;
                        },
                        obscureText: false,
                        hinttext: 'UserName',
                        icon: const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      customTextField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        obscureText: false,
                        hinttext: 'Email',
                        icon: const Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      customTextField(
                        controller: passwarController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        obscureText: ispassword,
                        hinttext: 'Password',
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            ispassword = !ispassword;
                          },
                          icon: ispassword
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
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
                          onPressed: () {
                            ispassword = !ispassword;
                          },
                          icon: ispassword
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ConditionalBuilder(
                        condition: state is! SignUpPatientLoadingState,
                        builder: (context) => customtext2(
                          text: 'Sign Up',
                          context: context,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SignUpAsPatientCubit.get(context).SignUpAsPatient(
                                username: nameController.text,
                                email: emailController.text,
                                password: passwarController.text,
                                confirmPassword: confirmPasswordController.text,
                              );
                            }
                          },
                        ),
                        fallback: (context) =>
                            const CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChoosenPage()),
                          );
                        },
                        child: const Text(
                          'Forget Your Password? ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
