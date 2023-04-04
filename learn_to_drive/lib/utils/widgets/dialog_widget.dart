//   import 'package:first_app/utils/colors.dart';
// import 'package:flutter/material.dart';

// Future<void> showStartDialog(
//   context, 
//   String title, 
//   String instruction, 
//   String leftButtonText, 
//   VoidCallback leftOnPressed,
//   String rightButtonText, 
//   VoidCallback rightOnPressed) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title, style: const TextStyle(color: Colors.white),),
//           backgroundColor: AppColors.secondaryBlack,
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 // const Text('This is a demo alert dialog.', style: TextStyle(color: Colors.white),),
//                 Text(instruction, style: const TextStyle(color: Colors.white),),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: leftOnPressed,
//               child: Text(leftButtonText, style: const TextStyle(color: Colors.white),), 
//             ),
//             TextButton(
//               onPressed: rightOnPressed,
//               child: Text(rightButtonText, style: const TextStyle(color: Colors.white),),
//             ),
//           ],
//         );
//       },
//     );
//   }