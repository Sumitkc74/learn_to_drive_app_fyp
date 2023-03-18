const String baseURL = "http://192.168.1.68:8181/api/"; //emulator localhost
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

String email = '';

getEmail(){
  return email.toString();
}

setEmail(String enteredEmail){
  email = enteredEmail;
}

