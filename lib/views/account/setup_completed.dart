import 'package:bundle_test/components/bottom_nav_bar.dart';
import 'package:bundle_test/components/verified_design.dart';
import 'package:bundle_test/controller/firebase_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_account.dart';

class Setup_Completed extends StatefulWidget {
  const Setup_Completed({Key? key}) : super(key: key);

  @override
  _Setup_CompletedState createState() => _Setup_CompletedState();
}

class _Setup_CompletedState extends State<Setup_Completed> {

  Firebase_Controller controller = Firebase_Controller();

  final firestoreInstance = FirebaseFirestore.instance;

  var profile_uid = "";
  var profile_email = "";
  var profile_username = "";
  var profile_name = "";
  var profile_photoUrl = "";


  @override
  void initState() {
    getUserData();
    // TODO: implement initState
    super.initState();
  }

  void getUserData() {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("User_Profiles").doc(firebaseUser!.uid).get().then((value){

      setState(() {
        profile_name = value.data()!["name"];
        profile_photoUrl = value.data()!["photoUrl"];
        profile_email = value.data()!["email"];
        profile_username = value.data()!["username"];
        profile_uid = value.data()!["uid"];
        controller.email.text = value.data()!["email"];
        controller.username.text = value.data()!["username"];
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(
                    height: 100,
                  ),

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
                                    child: Column(
                                      children:  [
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundImage:
                                          NetworkImage(
                                            profile_photoUrl,),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Text("Thanks for completing your registration",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("Full Name : " + profile_name ,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text("Username : " + profile_username,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text("Email Address: " + profile_email ,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      Center(
                                        child: Text("Kindly proceed to your dashboard",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      )

                                    ],
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  ButtonTheme(
                                      minWidth: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(()=> const Bottom_Nav_Bar());
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
                                              child: Text("PROCEED",
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
