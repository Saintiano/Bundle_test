import 'package:bundle_test/components/bottom_nav_bar.dart';
import 'package:bundle_test/components/history_tap.dart';
import 'package:bundle_test/constants/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'timecard_details.dart';

class Timecard_History extends StatefulWidget {
  const Timecard_History({Key? key}) : super(key: key);

  @override
  _Timecard_HistoryState createState() => _Timecard_HistoryState();
}

class _Timecard_HistoryState extends State<Timecard_History> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          title: const Text(
            "Timecard history",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black38),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.house,
                color: Colors.green,
              ),
              onPressed: () {
                Get.to(() => const Bottom_Nav_Bar());
              },
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade300,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
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
          child: const History_Tap(),
        )
    );
  }
}
