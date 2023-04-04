import 'package:first_app/Models/current_user_model.dart';

const String baseURL = "http://192.168.1.68:8000/api/"; //emulator localhost
const Map<String, String> headers = {
  "Accept": "application/json",
  "Content-Type": "application/json",
};

// errorSnackBar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar( 
//       backgroundColor: Colors.red,
//       content: Text(text),
//       duration: const Duration(seconds: 1),
//     )
//   );
// }

bool isEnglish = true;

setIsEnglish(bool isenglish){
  isEnglish = isenglish;
}

getIsEnglish(){
  return isEnglish;
}

checkLanguage(String english, String nepali){
  if(getIsEnglish()){
    return english;
  }
  else{
    return nepali;
  }
}