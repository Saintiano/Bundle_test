import 'dart:ui';

import 'package:bundle_test/components/bottom_nav_bar.dart';
import 'package:bundle_test/components/rounded_back_button.dart';
import 'package:bundle_test/controller/firebase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'complete_setup.dart';


class Create_Account extends StatefulWidget {
  const Create_Account({Key? key}) : super(key: key);

  @override
  _Create_AccountState createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {

  Firebase_Controller controller = Firebase_Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient:LinearGradient(
                colors: [
                  Color(0xFF4e3789),
                  Color(0xFF281261),
                  Color(0xFF281261),
                  Color(0xFF281261)
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Rounded_Back_Buttton(),
              Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset("assets/images/logo1.png",
                                  height: 180,
                                  width: 180,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Create a new account",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextField(
                                    controller: controller.email,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                      ),

                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),

                                      labelText: 'Email address',
                                    ),
                                    onSubmitted: (String value) async {
                                      await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Thanks!'),
                                            content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () { Navigator.pop(context); },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: controller.password,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                      ),

                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),

                                      labelText: 'Password (Min. 8 characters)',
                                    ),
                                    onSubmitted: (String value) async {
                                      await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Thanks!'),
                                            content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () { Navigator.pop(context); },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: controller.username,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                      ),

                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),

                                      labelText: 'Create a username',
                                    ),
                                    onSubmitted: (String value) async {
                                      await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Thanks!'),
                                            content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () { Navigator.pop(context); },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),


                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: const Text("By signing in, you agree to Bundle Africa terms and privacy policy",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ButtonTheme(
                                  minWidth: double.infinity,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.registerWithEmailAndPassword(controller.email.text, controller.password.text, controller.username.text);
                                    },
                                    child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFF4e3789),
                                                Color(0xFF281261),
                                                Color(0xFF281261),
                                                Color(0xFF281261)
                                                //add more colors for gradient
                                              ],
                                              begin: Alignment.centerRight, //begin of the gradient color
                                              end: Alignment.centerLeft, //end of the gradient color
                                              stops: [0.0, 0.9, 0.5, 0.8] //stops for individual color
                                            //set the stops number equal to numbers of color
                                          ),
                                        ),
                                        child: const  Center(
                                          child: Text("SIGN UP",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
              ),
            ],
          )
        )
      ),
    );
  }
}
