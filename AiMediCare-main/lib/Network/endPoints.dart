const BASEURL = 'https://ai-medicare-2.onrender.com/';
const SIGNUPASPATIENT = 'api/users/signupAsPatient';
const SIGNUPASDOCTOR = 'api/users/signupAsDoctor';
const LOGIN = 'api/users/login';
const BMI = 'api/patients/bmi';
// ?weight=70&height=180
const BMR = 'api/patients/bmr';
// ?age=27&gender=male&weight=70&height=180&activityLevel=lightly active';
const BODYFATS = 'api/patients/bodyFat';
// ?gender=male&weight=70&height=180&age=21
const WATERINTAKE = 'api/patients/waterIntake';
// ?weight=70&activityLevel=sedentary
const SYMPTOMS = 'api/patients/symptoms';

String token = '';
String role = '';

// void signout(context) {
//   CacheHelper.removeroleData(key: key)
//   CacheHelper.removetokenData(key: 'token').then((value) {
//     if (value) {
      
//     }
//   });
// }
