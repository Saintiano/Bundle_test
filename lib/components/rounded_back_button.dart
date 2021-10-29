import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rounded_Back_Buttton extends StatelessWidget {
  const Rounded_Back_Buttton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        margin: const EdgeInsets.only(
            left: 40,
            top: 40
        ),
        height: 40,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
              colors: [
                Color(0xFF4e3789),
                Color(0xFF4e3789),
                Color(0xFF4e3789),
                Color(0xFF4e3789)
                //add more colors for gradient
              ],
              begin: Alignment.centerRight, //begin of the gradient color
              end: Alignment.centerLeft, //end of the gradient color
              stops: [0.2, 0.2, 0.5, 0.8] //stops for individual color
            //set the stops number equal to numbers of color
          ),
        ),
        child: const  Center(
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: Colors.white,
            )
        ),
      ),
    );
  }
}
