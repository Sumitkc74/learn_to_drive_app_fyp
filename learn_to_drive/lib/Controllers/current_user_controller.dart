
// import 'dart:developer';
// import 'package:first_app/Models/current_user.dart';
// import 'package:first_app/Services/repo/current_user_repo.dart';
// import 'package:get/get.dart';

// class CurrentUserController extends GetxController {
//   RxList<CurrentUser> currentUsers = RxList();
//   RxBool loading = false.obs;
//   @override
//   void onInit() {
//     getCurrentUser();
//     super.onInit();
//   }

//   getCurrentUser() async {
//     loading.value = true;
//     await CurrentUserRepo.getUser(
//       onSuccess: (currentUser) {
//         loading.value = false;
//         currentUsers.addAll(currentUser);
//       },
//       onError: ((message) {
//         loading.value = false;
//         log("error ");
//       }),
//     );
//   }
// }
