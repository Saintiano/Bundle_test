
import 'package:bundle_test/constants/styles.dart';
import 'package:bundle_test/controller/logic_controller.dart';
import 'package:bundle_test/views/timecard/timecard_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class History_Tap extends StatefulWidget {
  const History_Tap({Key? key}) : super(key: key);

  @override
  _History_TapState createState() => _History_TapState();
}

class _History_TapState extends State<History_Tap> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  Crud_Logic crud_logic = Crud_Logic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Project_Timecards').doc(_auth.currentUser!.uid).collection("timecards").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];

                return GestureDetector(
                    onTap: (){

                      String uid = doc['uid'];
                      String email = doc['email'];
                      String name = doc['name'];
                      String photoUrl = doc['photoUrl'];

                      String username = doc['username'];
                      String company = doc['company'];
                      String position = doc['position'];
                      String phone_number = doc['phone_number'];
                      String date_of_registration = doc['date_of_registration'];

                      String state = doc['state'];
                      String address = doc['address'];
                      String gender = doc['gender'];
                      String total_hours_worked = doc['total_hours_worked'];
                      String total_revenue_generated = doc['total_revenue_generated'];
                      String active = doc['active'];

                      String billable_rate = doc['billable_rate'];
                      String project_name = doc['product_id'];
                      String date_created = doc['date_created'];
                      String date_worked = doc['date_worked'];
                      String time_started = doc['time_started'];
                      String time_finished = doc['time_finished'];
                      String total_time_worked = doc['total_time_worked'];
                      String revenue_generated = doc['revenue_generated'];
                      String sortData = doc['sortData'];
                      String docId = doc['docId'];

                      Get.to(() => const Timecard_Details(), arguments: [
                      uid, email, name, photoUrl, username, company, position, phone_number, date_of_registration,

                      state, address, gender, total_hours_worked, total_revenue_generated, active,

                      billable_rate, project_name, date_created, date_worked, time_started, time_finished,
                        total_time_worked, revenue_generated, sortData, docId
                      ]

                      );
                    },
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Card(
                        elevation: 5,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      "assets/images/bill.png"),
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.1),
                                      BlendMode.dstATop),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                BorderRadius.circular(5.0),
                                color: Colors.black87),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                    leading: Container(
                                      height: 400,
                                      decoration: BoxDecoration(
                                          color: AppColor.lightgrey,
                                          borderRadius: BorderRadius.circular(10)),
                                      padding: const EdgeInsets.all(0),
                                      margin: const EdgeInsets.all(4),
                                      child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: const AssetImage(
                                                    "assets/images/bill.png"),
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black.withOpacity(0.0),
                                                    BlendMode.dstATop),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              color: AppColor.purpleLight),
                                          height: 45,
                                          width: 45,
                                          child: Image.asset(
                                            "assets/images/bill.png",
                                          )
                                      ),
                                    ),
                                    title: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            doc['name'],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  doc['revenue_generated'],
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  doc['billable_rate'],
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doc['product_id'],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          "Status",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: const Icon(FontAwesomeIcons.arrowRight,
                                      color: Colors.white70,
                                      size: 15,
                                    )
                                ),

                              ],
                            )
                        ),
                      ),
                    )
                );
              });
        } else {
          return Text("No data");
        }
      },
    );
  }
}
