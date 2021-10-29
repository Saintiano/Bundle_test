import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'dart:async';

import 'package:get/instance_manager.dart';

import 'login.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  late Timer _timer;
  int _start = 4;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Get.to(()=> const Login());
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Start duration of screen
    startTimer();
  }

  @override
  void dispose() {
    //end duration of screen
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient:LinearGradient(
              colors: [
                Color(0xFF1e0f60),
                Color(0xFF1e0f50),
                Color(0xFF1e0f50),
                Color(0xFF1e0f50)
                //add more colors for gradient
              ],
              begin: Alignment.topRight, //begin of the gradient color
              end: Alignment.bottomRight, //end of the gradient color
              stops: [0, 0.2, 0.5, 0.8] //stops for individual color
            //set the stops number equal to numbers of color
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)
          )
      ),
      child: Center(
        child: Image.asset("assets/images/logo.jpeg",
          height: 180,
          width: 180,
        ),
      ),
    );
  }
}
