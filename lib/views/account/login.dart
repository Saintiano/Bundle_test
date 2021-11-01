
import 'package:bundle_test/components/bottom_nav_bar.dart';
import 'package:bundle_test/controller/firebase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_account.dart';
import '../dashboard.dart';
import 'forgot_password.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Firebase_Controller controller = Firebase_Controller();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF341f6b),
                  Color(0xFF341f6b),
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
        child: Center(
          child: SingleChildScrollView(
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
                      const Text("Welcome!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
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
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 0.9),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),

                              labelText: 'Enter email address',
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
                            height: 35,
                          ),
                          TextField(
                            controller: controller.password,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple, width: 0.9),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 0.9),
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
                            height: 30,
                          ),
                          GestureDetector(
                            onTap:(){
                              Get.to(()=> const Foregot_Password());
                            },
                            child: const Text("Forgot Password?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ButtonTheme(
                              minWidth: double.infinity,
                              child: GestureDetector(
                                onTap: () {
                                  controller.signInWithEmailAndPassword(controller.email.text, controller.password.text);
                                },
                                child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.orangeAccent),
                                    child: const  Center(
                                      child: Text("LOG IN",
                                        style: TextStyle(
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

                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> const Create_Account());
                  },
                  child: const Text("New User? Create a new account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
