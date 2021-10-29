
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

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _referalCode = TextEditingController();
  final TextEditingController _countryCode = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

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

                    Divider(),
                    const ListTile(
                      title: Text("Project name"),
                      subtitle: Text("Facebook"),
                      leading: Icon(Icons.local_parking_rounded),
                    ),
                    const ListTile(
                      title: Text("Billable rate"),
                      subtitle: Text("100"),
                      leading: Icon(Icons.monetization_on),
                    ),
                    const ListTile(
                      title: Text("Project revenue"),
                      subtitle: Text("2000"),
                      leading: Icon(Icons.money),
                    ),
                    const ListTile(
                      title: Text("Date create"),
                      subtitle: Text("2019-07-01 "),
                      leading: Icon(Icons.calendar_today),
                    ),
                    const ListTile(
                      title: Text("Start time"),
                      subtitle: Text("09:00"),
                      leading: Icon(Icons.timer),
                    ),
                    const ListTile(
                      title: Text("End time"),
                      subtitle: Text("17:00"),
                      leading: Icon(Icons.timer),
                    ),
                    const ListTile(
                      title: Text("Total time worked (in minutes)"),
                      subtitle: Text("234"),
                          leading: Icon(Icons.lock_clock),
                    ),
                    const Divider(
                      height: 2,
                      thickness: 1,
                    ),
                    const ListTile(
                      title: Text("Full Name"),
                      subtitle: Text("Temi Jane"),
                      leading: Icon(Icons.person),
                    ),
                    const ListTile(
                      title: Text("Email"),
                      subtitle: Text("butterfly.little@gmail.com"),
                      leading: Icon(Icons.email),
                    ),
                    const ListTile(
                      title: Text("Phone"),
                      subtitle: Text("+977-9815225566"),
                      leading: Icon(Icons.phone),
                    ),
                    const ListTile(
                      title: Text("Position"),
                      subtitle: Text("Marketer"),
                      leading: Icon(Icons.web),
                    ),

                    const ListTile(
                      title: Text("state"),
                      subtitle: Text("Kano"),
                      leading: Icon(Icons.location_on_rounded),
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
