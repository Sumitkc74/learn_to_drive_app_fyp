import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String label;
  const PasswordTextField({super.key, required this.label});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController _controller = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: const Icon(Icons.lock),
        hintText: widget.label,
        suffixIcon: IconButton(
          icon: Icon(!isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
  String get value => _controller.text.toString();
}

// class TextFieldWidget extends StatefulWidget {
//   final String label;
//   final IconData icon;
//   final Function(String)? onChanged;

//   const TextFieldWidget({
//     super.key, 
//     required this.label, 
//     required this.icon, 
//     this.onChanged,
//   });

//   @override
//   _TextFieldWidgetState createState() => _TextFieldWidgetState();
// }

// class _TextFieldWidgetState extends State<TextFieldWidget> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _controller,
//       decoration: InputDecoration(
//         filled: true, 
//         prefixIcon: Icon(widget.icon),
//         hintText: widget.label,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       onChanged: (value) {
//         if (widget.onChanged != null) {
//           widget.onChanged!(value);
//         }
//       },
//     );
//   }
//   String get value => _controller.text;
// }