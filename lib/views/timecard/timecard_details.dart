
import 'package:bundle_test/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'update_timecard.dart';

class Timecard_Details extends StatefulWidget {
  const Timecard_Details({Key? key}) : super(key: key);

  @override
  _Timecard_DetailsState createState() => _Timecard_DetailsState();
}

class _Timecard_DetailsState extends State<Timecard_Details> {

  var timecardDetails = Get.arguments;

  @override
  Widget build(BuildContext context) {

    String uid = timecardDetails[0];
    String email = timecardDetails[1];
    String name = timecardDetails[2];
    String photoUrl = timecardDetails[3];

    String username = timecardDetails[4];
    String company = timecardDetails[5];
    String position = timecardDetails[6];
    String phone_number = timecardDetails[7];
    String date_of_registration = timecardDetails[8];

    String state = timecardDetails[9];
    String address = timecardDetails[10];
    String gender = timecardDetails[11];
    String total_hours_worked = timecardDetails[12];
    String total_revenue_generated = timecardDetails[13];
    String active = timecardDetails[14];

    String billable_rate = timecardDetails[15];
    String project_name = timecardDetails[16];
    String date_created = timecardDetails[17];
    String date_worked = timecardDetails[18];
    String time_started = timecardDetails[19];
    String time_finished = timecardDetails[20];
    String total_time_worked = timecardDetails[21];
    String revenue_generated = timecardDetails[22];
    String sortData = timecardDetails[23];
    String docId = timecardDetails[24];

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
          "Timecard details",
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
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: <Widget>[

                    const Divider(),
                    ListTile(
                      title: const Text("Project name"),
                      subtitle: Text(project_name),
                      leading: const Icon(Icons.local_parking_rounded),
                    ),
                    ListTile(
                      title: const  Text("Billable rate"),
                      subtitle: Text(billable_rate),
                      leading: const Icon(Icons.monetization_on),
                    ),
                    ListTile(
                      title: const Text("Project revenue"),
                      subtitle: Text(revenue_generated),
                      leading: const Icon(Icons.money),
                    ),
                    ListTile(
                      title: const  Text("Date create"),
                      subtitle: Text(date_created),
                      leading: const Icon(Icons.calendar_today),
                    ),
                    const ListTile(
                      title: Text("Start time"),
                      subtitle: Text("09:00"),
                      leading: Icon(Icons.timer),
                    ),
                    ListTile(
                      title: const Text("End time"),
                      subtitle: Text(time_started),
                      leading: const Icon(Icons.timer),
                    ),
                    ListTile(
                      title: const Text("Total time worked (in minutes)"),
                      subtitle: Text(total_time_worked),
                          leading:const Icon(Icons.lock_clock),
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                    ),
                    ListTile(
                      title: const Text("Full Name"),
                      subtitle: Text(name),
                      leading: const Icon(Icons.person),
                    ),
                    ListTile(
                      title: const Text("Email"),
                      subtitle: Text(email),
                      leading: const Icon(Icons.email),
                    ),
                    ListTile(
                      title: const Text("Phone"),
                      subtitle: Text(phone_number),
                      leading: const Icon(Icons.phone),
                    ),
                    ListTile(
                      title: const Text("Position"),
                      subtitle: Text(position),
                      leading: const Icon(Icons.web),
                    ),

                    ListTile(
                      title: const Text("state"),
                      subtitle: Text(state),
                      leading: const Icon(Icons.location_on_rounded),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonTheme(
                                minWidth: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Update_Timecard());
                                  },
                                  child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue),
                                      child: const  Center(
                                        child: Text("UPDATE TIMECARD",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ButtonTheme(
                                minWidth: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.snackbar("title", "message");
                                  },
                                  child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.red),
                                      child: const  Center(
                                        child: Text("DELETE TIMECARD",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
          )
      ),
    );
  }
}
