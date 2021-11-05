import 'package:bundle_test/constants/data.dart';
import 'package:bundle_test/controller/logic_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../profile/profile.dart';

class Create_Timecard extends StatefulWidget {
  const Create_Timecard({Key? key}) : super(key: key);

  @override
  _Create_TimecardState createState() => _Create_TimecardState();
}

class _Create_TimecardState extends State<Create_Timecard> {

  Crud_Logic crud_logic = Crud_Logic();
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
        profile_uid = value.data()!["uid"];
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



      });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
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
          "Create timecard",
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
              Icons.person,
              color: Colors.green,
            ),
            onPressed: () {
              Get.to(() => const Profile());
            },
          ),
        ],
      ),
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
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                    child: Image.asset(
                                      "assets/images/logo1.png",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Create a new timecard",
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
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      ///Menu Mode with no searchBox
                                      DropdownSearch<String>(
                                        validator: (v) =>
                                        v == null
                                            ? "required field"
                                            : null,
                                        hint: "Select a gender",
                                        mode: Mode.MENU,
                                        showSelectedItem: true,
                                        items: project,
                                        label: "Select a project company *",
                                        showClearButton: true,
                                        onChanged: print,
                                        popupItemDisabled: (String? s) =>
                                        s?.startsWith('Z') ?? false,
                                        //Deactivate any option starting with letter Z
                                        clearButtonSplashRadius: 20,
                                        selectedItem: "Select a project company",
                                        //Preselected data
                                        onBeforeChange: (a, b) {
                                          if (b == null) {
                                            AlertDialog alert = AlertDialog(
                                              title: const Text(
                                                  "Are you sure..."),
                                              content: const Text(
                                                  "...you want to clear the selection"),
                                              actions: [
                                                TextButton(
                                                  child: const Text("OK"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop(
                                                        true);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text("NOT OK"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop(
                                                        false);
                                                  },
                                                ),
                                              ],
                                            );

                                            return showDialog<bool>(
                                                context: context,
                                                builder: (
                                                    BuildContext context) {
                                                  return alert;
                                                });
                                          }

                                          return Future.value(true);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 0),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                  alignment: AlignmentDirectional
                                                      .topStart,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 1.0,
                                                    horizontal: 0.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius: BorderRadius
                                                        .circular(5.0),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      crud_logic.selectTime(
                                                          context);
                                                    },
                                                    child: Row(
                                                      children: const [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Icon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            color: Colors.white,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 10,
                                                          child: Text(
                                                            "   |   Pick start time and end time",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              fontSize: 13.0,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: 70,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.only(top: 20,),
                                        decoration: const BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5)
                                            )
                                        ),
                                        child: Obx(() {
                                          return Column(
                                            children: [
                                              Text("Starting: " + crud_logic.startTime.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text("Ending:  " + crud_logic.startEnd.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                      )

                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: crud_logic.total_time_worked,
                                    onChanged: (value){
                                      crud_logic.total_time_worked.text = value;
                                    },
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.purple, width: 0.9),
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),

                                      labelText: 'Total Hours Worked',
                                    ),
                                    onSubmitted: (String value) async {
                                      await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Thanks!'),
                                            content: Text(
                                                'You typed "$value", which has length ${value
                                                    .characters.length}.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),

                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                              alignment: AlignmentDirectional
                                                  .topStart,
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                vertical: 1.0,
                                                horizontal: 0.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius: BorderRadius
                                                    .circular(5.0),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  crud_logic.selectDate(
                                                      context);
                                                },
                                                child: Row(
                                                  children: const [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .businessTime,
                                                        color: Colors.white,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 9,
                                                      child: Text(
                                                        "   |  Select date",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .bold,
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              margin: const EdgeInsets.only(
                                                  left: 20),
                                              child: Obx(() {
                                                return Text(
                                                  "${crud_logic.pickedDate}"
                                                      .split(' ')[0],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 14
                                                  ),
                                                );
                                              }),
                                            ))
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ButtonTheme(
                                      minWidth: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          crud_logic.saveUpdateTimecard( profile_uid , profile_email, profile_name,
                                              profile_photoUrl, profile_username, profile_company, profile_position, profile_phone_number, profile_date_of_registration,
                                              profile_state, profile_address, profile_gender, profile_total_hours_worked, profile_total_revenue_generated, profile_active, crud_logic.project_name.text, crud_logic.pickedDate.value, crud_logic.startTime.toString(), crud_logic.startEnd.toString(),
                                              crud_logic.total_time_worked.text, 1);
                                        },
                                        child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(5),
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xFF4e3789),
                                                    Color(0xFF281261),
                                                    Color(0xFF281261),
                                                    Color(0xFF281261)
                                                    //add more colors for gradient
                                                  ],
                                                  begin: Alignment.centerRight,
                                                  //begin of the gradient color
                                                  end: Alignment.centerLeft,
                                                  //end of the gradient color
                                                  stops: [
                                                    0.0,
                                                    0.9,
                                                    0.5,
                                                    0.8
                                                  ] //stops for individual color
                                                //set the stops number equal to numbers of color
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text("CREATE TIMECARD",
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
