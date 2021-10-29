import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Verified_Design extends StatelessWidget {
  const Verified_Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.only(
            top: 20
        ),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
              colors: [
                Color(0xffc1b5e0),
                Color(0xFFc1b5e0),
                Color(0xFFc1b5e0),
                Color(0xFFc1b5e0)
                //add more colors for gradient
              ],
              begin: Alignment.centerRight, //begin of the gradient color
              end: Alignment.centerLeft, //end of the gradient color
              stops: [0.2, 0.2, 0.5, 0.8] //stops for individual color
            //set the stops number equal to numbers of color
          ),
        ),
        child: const  Center(
            child: Image(
                height: 35,
                width: 35,
                image: AssetImage('assets/images/check.png')
            ),
        ),
      ),
    );
  }
}
