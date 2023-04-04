import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Timer extends AnimatedWidget {
  Timer ({Key? key, required this.animation}): super (key: key, listenable: animation);
  Animation<int> animation;

  @override
  Widget build (BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    var timerText = '${clockTimer.inMinutes.remainder (60).toString()} = '
    '${(clockTimer.inSeconds.remainder (60) % 60).toString().padLeft (2, '0')}';
    return Text(
      timerText, 
      style: TextStyle (
        fontSize: 40, 
        color: Theme.of (context).primaryColor
      ),
    );
  }
}