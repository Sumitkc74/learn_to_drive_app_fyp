import 'package:flutter/material.dart';

class TextOnlyButtonWidget extends StatelessWidget {
  const TextOnlyButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.size,
    this.mainAxisAlignment,
  }) : super(key: key);

  final double size;
  final String label;
  final MainAxisAlignment? mainAxisAlignment;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onPressed, 
          child: Text(
            label,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: const Color(0xFFFFDE17),
              fontSize: size,
            )
          )
        )
      ],
    );
  }
}


class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.margin,
  }) : super(key: key);

  final double margin;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFDE17),
        borderRadius: BorderRadius.circular(10),
      ),
      child:(
        TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              // color: Colors.white,
            )
          )
        )
      ),
    );
  }
}

class QuestionOptionButtonWidget extends StatelessWidget {
  const QuestionOptionButtonWidget({
    Key? key,
    required this.option,
    required this.onPressed,
  }) : super(key: key);

  final String option;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      minWidth: double.infinity,
      onPressed: onPressed,
      child: Text(
        option, style: 
        const TextStyle(fontSize: 15),
      )
    );
  }
}