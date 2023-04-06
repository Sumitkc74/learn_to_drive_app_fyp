import 'package:first_app/utils/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChoosePdfLanguage extends StatefulWidget {
  // String? chosenLanguage;
  String chosenLanguage;

  CustomChoosePdfLanguage({
    super.key,
    required this.chosenLanguage
  });

  @override
  State<CustomChoosePdfLanguage> createState() => _CustomChoosePdfLanguageState();
}

class _CustomChoosePdfLanguageState extends State<CustomChoosePdfLanguage> {
  void changeFile(String language) {
    setState(() {
      widget.chosenLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row( 
      children : [ 
        Expanded ( 
          child : ChooseLanguageButtonWidget(
            buttonLanguage: 'English',
            chosenLanguage: widget.chosenLanguage.toString(), 
            onPressed: (){
              changeFile('English');
            } ,
          )
        ),
        Expanded ( 
          child : ChooseLanguageButtonWidget(
            buttonLanguage: 'Nepali',
            chosenLanguage: widget.chosenLanguage.toString(), 
            onPressed: (){
              changeFile('Nepali');
            },
          )
        ),
      ]
    );
  }
}


