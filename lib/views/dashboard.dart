
import 'dart:ui';

import 'package:bundle_test/components/history_tap.dart';
import 'package:bundle_test/components/create_timecard_card.dart';
import 'package:bundle_test/constants/images.dart';
import 'package:bundle_test/controller/firebase_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/transaction_history_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final image = avatars[1];
  Firebase_Controller controller = Firebase_Controller();
  final firestoreInstance = FirebaseFirestore.instance;

  var profile_uid = "";
  var profile_email = "";
  var profile_username = "";
  var profile_name = "";
  var profile_photoUrl = "";

  var profile_company = "";
  var profile_position = "";
  var profile_phone_number = "";
  var profile_date_of_registration = "";

  var profile_total_hours_worked = "";
  var profile_total_revenue_generated = "";
  var profile_active = "";


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

        profile_company = value.data()!["company"];
        profile_position = value.data()!["position"];
        profile_phone_number = value.data()!["phone_number"];
        profile_date_of_registration = value.data()!["date_of_registration"];

        profile_total_hours_worked = value.data()!["total_hours_worked"];
        profile_total_revenue_generated = value.data()!["total_revenue_generated"];
        profile_active = value.data()!["active"];

        profile_uid = firebaseUser!.uid;
        controller.email.text = value.data()!["email"];
        controller.username.text = value.data()!["username"];
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: GestureDetector(
          onTap: (){
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
          "Dashboard",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black38
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Colors.red,
                            ],
                          ),
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(0),
                              topLeft: Radius.circular(0)
                          )
                      ),
                      child: Column(
                        children: [
                          Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 40),
                                padding: const EdgeInsets.all(5),
                                width: 140,
                                height: 25,
                                decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(100),
                                        bottomRight: Radius.circular(100),
                                        topRight: Radius.circular(100),
                                        topLeft: Radius.circular(100)
                                    )
                                ),
                                child: const Center(
                                  child:  Text("Total Revenue",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Container(
                            child: Center(
                                child: Container(
                                    margin: const EdgeInsets.only(top: 0),
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            bottomRight: Radius.circular(100),
                                            topRight: Radius.circular(100),
                                            topLeft: Radius.circular(100)
                                        )
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(profile_total_revenue_generated,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const  Text("Naira",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                )
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 16.0),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 96.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  <Widget>[
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text(profile_name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                          ),
                                        ),
                                        subtitle: Text(profile_username),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  height: 10.0,
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        children: const <Widget>[
                                          Text("285",
                                            style: TextStyle(

                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Total Projects")
                                        ],
                                      ),
                                    ),
                                    const VerticalDivider(
                                      width: 10.0,
                                      thickness: 20,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(profile_total_hours_worked,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("Total Time")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(profile_photoUrl), fit: BoxFit.cover)),
                            margin: const EdgeInsets.only(left: 16.0, bottom: 36),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 5, left: 5),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Row(
                children: const [
                  Create_Timecard_Card(),
                  Timecard_History_Card()
                ],
              ),
            ),
            History_Tap(),
          ],
        )
      ),
    );
  }

}
