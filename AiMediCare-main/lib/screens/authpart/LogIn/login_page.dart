import 'package:ai_medicare/DataLocal/Cache_Helper.dart';
import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/screens/authpart/LogIn/loginCubit/LoginCubit.dart';
import 'package:ai_medicare/screens/authpart/LogIn/loginCubit/LoginStates.dart';
import 'package:ai_medicare/screens/choosen_page.dart';
import 'package:ai_medicare/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  bool isLoading = false;
  bool ispassword = true;
  static String id = 'login page';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginFailState || state is LoginErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('message ${LoginCubit.get(context).model!.message}')),
        );
      } else if (state is LoginSuccsessState) {
        CacheHelper.saveData(key: 'role', value: state.model!.data!.user!.role)
            .then((value) {
          role = state.model!.data!.user!.role ?? '';
          print(state.model!.data!.user!.email);
          print(role);
          print(state.model!.data!.user!.role);
        });
        if (state.model!.data!.user!.role == 'patient') {
          CacheHelper.saveData(key: 'token', value: state.model!.token)
              .then((value) {
            token = state.model!.token ?? '';
            print(state.model!.data!.user!.email);
            print(token);
          });
          Navigator.pushReplacementNamed(context, 'PaientMain page',
              arguments: [token, role]);
        } else if (state.model!.data!.user!.role == 'doctor') {
          CacheHelper.saveData(key: 'token', value: state.model!.token)
              .then((value) {
            token = state.model!.token ?? '';
            print(state.model!.data!.user!.email);
            print(token);
            Navigator.pushReplacementNamed(context, 'DoctorMain page',
                arguments: [token, role]);
          });
        }

        // Navigator.pushReplacementNamed(context, 'PaientMain page');
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Icon Logo
                    const SizedBox(
                      height: 90,
                    ),
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70)),
                      child: Image.asset('assets/AI MEDICARE 2.png'),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    //greeting text

                    const Text('Welcome back, you',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),

                    const SizedBox(
                      height: 40,
                    ),

                    //email text field
                    customTextField(
                      obscureText: false,
                      hinttext: 'email ',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
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
                        hinttext: 'Password',
                        controller: passwordController,
                        onSubmitter: (() {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        }),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
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
                    const SizedBox(
                      height: 20.0,
                    ),

                    customtext2(
                      text: 'Log In',
                      context: context,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont Have An Account? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChoosenPage()));
                          },
                          child: const Text(
                            'Sign Up ',
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
          ),
        ),
      );
    });
  }
}
