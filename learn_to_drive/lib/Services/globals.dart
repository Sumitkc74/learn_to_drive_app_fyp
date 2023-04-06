
const String baseURL = "http://192.168.1.68:8000/api/"; //emulator localhost
const Map<String, String> headers = {
  "Accept": "application/json",
  "Content-Type": "application/json",
};

const String loginAPI = '${baseURL}auth/login';
const String registerAPI = '${baseURL}auth/register';
const String changePasswordAPI = '${baseURL}auth/changePassword';
const String logoutAPI = '${baseURL}auth/logout';

const String trafficSignAPI = '${baseURL}trafficSign';
const String visionTestAPI = '${baseURL}visionTest';
const String examPaperAPI = '${baseURL}examPaper';
const String examInformationAPI = '${baseURL}examInformation';
const String tutorialAPI = '${baseURL}tutorial';
const String noticeAPI = '${baseURL}notice';
const String questionAPI = '${baseURL}question';
const String paymentAPI = '${baseURL}khalti/payment';

const String userHistoryAPI = '${baseURL}userHistory';

// errorSnackBar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar( 
//       backgroundColor: Colors.red,
//       content: Text(text),
//       duration: const Duration(seconds: 1),
//     )
//   );
// }

