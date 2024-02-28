import 'package:ai_medicare/Network/endPoints.dart';
import 'package:ai_medicare/cubit/cubit.dart';
import 'package:ai_medicare/screens/authpart/signUpAsDoctor/cubit/signUpAsDoctorCubit.dart';
import 'package:ai_medicare/screens/doctorpart/heart_attack.dart';
import 'package:ai_medicare/screens/doctorpart/investigations/BrainTumer.dart';
import 'package:ai_medicare/screens/doctorpart/investigations/breast_cancer.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMI/Bmi.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMI/cubit/BmiCubit.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMR/Bmr.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/BMR/cubit/BMRcubit.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/bodyFats/body_fat.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/bodyFats/cubit/BodyFatsCubit.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/health_calcu.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/waterIntake/cubit/WaterIntakeCubit.dart';
import 'package:ai_medicare/screens/patientpart/Calculators/waterIntake/water_intake.dart';
import 'package:ai_medicare/screens/patientpart/Emergency/nearest_hospitas.dart';
import 'package:ai_medicare/screens/patientpart/Emergency/sos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DataLocal/Cache_Helper.dart';
import 'Network/dio.Helper.dart';
import 'screens/authpart/LogIn/loginCubit/LoginCubit.dart';
import 'screens/authpart/LogIn/login_page.dart';
import 'screens/authpart/signUpAsDoctor/doctor_signup.dart';
import 'screens/authpart/signUpAsPatient/cubit/blocObserver.dart';
import 'screens/authpart/signUpAsPatient/cubit/signUpAsPatientCubit.dart';
import 'screens/authpart/signUpAsPatient/patient_signup.dart';
import 'screens/choosen_page.dart';
import 'screens/doctorpart/investigations/docMain_page.dart';
import 'screens/patientpart/paientMain.dart';
import 'screens/patientpart/systemCheckers/symptoms_checker.dart';
import 'screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.dio;
  Bloc.observer = MyBlocObserver();
  token = CacheHelper.getData(key: 'token') ?? '';
  role = CacheHelper.getData(key: 'role') ?? '';

  print('main $token');
  print('main $role');

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => SignUpAsPatientCubit()),
    BlocProvider(create: (context) => SignUpAsDoctorCubit()),
    BlocProvider(create: (context) => BmiCubit()),
    BlocProvider(create: (context) => BmrCubit()),
    BlocProvider(create: (context) => BodyFatsCubit()),
    // BlocProvider(create: (context) => SyptomsCubit()..getSymptoms(token)),
    BlocProvider(create: (context) => WaterInTakeCubit()),
    BlocProvider(create: (context) => generalCubit()),
    BlocProvider(
      create: (context) => LoginCubit(),
    ),
  ], child: const AiMediCare()));
}

class AiMediCare extends StatelessWidget {
  const AiMediCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BmiPage(),
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        ChoosenPage.id: (context) => ChoosenPage(),
        LoginPage.id: (context) => LoginPage(),
        DoctorSignUP.id: (context) => DoctorSignUP(),
        PatientSignUp.id: (context) => PatientSignUp(),
        DoctorMainPage.id: (context) => DoctorMainPage(),
        PaientMainPage.id: (context) => PaientMainPage(),
        SymptomsCheckerPage.id: (context) => SymptomsCheckerPage(),
        HealthCalcuPage.id: (context) => HealthCalcuPage(),
        SosPage.id: (context) => SosPage(),
        NearestHospitalsPge.id: (context) => NearestHospitalsPge(),
        BrainTumerPage.id: (context) => BrainTumerPage(),
        BreastCancerPage.id: (context) => BreastCancerPage(),
        HeartAttackPage.id: (context) => HeartAttackPage(),
        BmiPage.id: (context) => BmiPage(),
        BmrPage.id: (context) => BmrPage(),
        WaterIntakePage.id: (context) => WaterIntakePage(),
        BodyFatPage.id: (context) => BodyFatPage(),
      },
      initialRoute: WelcomePage.id,
    );
  }
}
