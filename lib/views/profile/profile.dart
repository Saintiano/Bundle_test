
import 'package:bundle_test/components/network_image.dart';
import 'package:bundle_test/constants/images.dart';
import 'package:bundle_test/controller/firebase_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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

  var profile_state = "";
  var profile_address = "";
  var profile_gender = "";
  var profile_billable_rate = "";
  var profile_project_name = "";
  var profile_date_created = "";
  var profile_date_worked = "";
  var profile_time_started = "";
  var profile_time_finished = "";
  var profile_total_time_worked = "";
  var profile_revenue_generated = "";


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

        profile_state  = value.data()!["state"];
        profile_address  = value.data()!["address"];
        profile_gender  = value.data()!["gender"];

        profile_billable_rate  = value.data()!["billable_rate"];
        profile_project_name  = value.data()!["project_name"];
        profile_date_created  = value.data()!["date_created"];
        profile_date_worked  = value.data()!["date_worked"];
        profile_time_started  = value.data()!["time_started"];
        profile_time_finished = value.data()!["time_finished"];
        profile_total_time_worked = value.data()!["total_time_worked"];
        profile_revenue_generated = value.data()!["revenue_generated"];

        profile_uid = value.data()!["uid"];
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
          "User profile",
          style: TextStyle(
              fontSize: 14,
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
            onPressed: () {
              Get.to(()=> const Edit_Profile());
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PNetworkImage(
                profile_photoUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    contentPadding: const EdgeInsets.all(0),
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
                                      Text("Total Transactions")
                                    ],
                                  ),
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
                                      const Text("Total Amounts")
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
                        margin: const EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        const  ListTile(
                          title: Text("User information"),
                        ),
                        const Divider(),
                        ListTile(
                          title:  const Text("Full Name"),
                          subtitle: Text(profile_name),
                          leading: const Icon(Icons.person),
                        ),
                        ListTile(
                          title:  const Text("Email"),
                          subtitle: Text(profile_email),
                          leading: const Icon(Icons.email),
                        ),
                        ListTile(
                          title:  const Text("Phone"),
                          subtitle: Text(profile_phone_number),
                          leading: const Icon(Icons.phone),
                        ),
                        ListTile(
                          title: const Text("Designation"),
                          subtitle: Text(profile_position),
                          leading: const Icon(Icons.web),
                        ),


                        ListTile(
                          title: const Text("state"),
                          subtitle: Text(profile_state),
                          leading: const Icon(Icons.location_on_rounded),
                        ),
                        const SizedBox(
                          height: 35,
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),

                ],
              ),
            ),
            const SizedBox(height: 20.0),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
