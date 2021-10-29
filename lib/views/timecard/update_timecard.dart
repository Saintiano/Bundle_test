import 'package:bundle_test/constants/data.dart';
import 'package:bundle_test/views/profile/profile.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_range_picker/time_range_picker.dart';

class Update_Timecard extends StatefulWidget {
  const Update_Timecard({Key? key}) : super(key: key);

  @override
  _Update_TimecardState createState() => _Update_TimecardState();
}

class _Update_TimecardState extends State<Update_Timecard> {

  String _startTime = "";
  String _startEnd = "";

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
          "Update timecard",
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
                                    child: Image.asset("assets/images/logo1.png",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Update timecard",
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
                                        validator: (v) => v == null ? "required field" : null,
                                        hint: "Select a gender",
                                        mode: Mode.MENU,
                                        showSelectedItem: true,
                                        items: project,
                                        label: "Select a project company *",
                                        showClearButton: true,
                                        onChanged: print,
                                        popupItemDisabled: (String? s) => s?.startsWith('Z') ?? false, //Deactivate any option starting with letter Z
                                        clearButtonSplashRadius: 20,
                                        selectedItem: "Select a project company",//Preselected data
                                        onBeforeChange: (a, b) {
                                          if (b == null) {
                                            AlertDialog alert = AlertDialog(
                                              title: const Text("Are you sure..."),
                                              content: const Text("...you want to clear the selection"),
                                              actions: [
                                                TextButton(
                                                  child: const Text("OK"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop(true);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text("NOT OK"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop(false);
                                                  },
                                                ),
                                              ],
                                            );

                                            return showDialog<bool>(
                                                context: context,
                                                builder: (BuildContext context) {
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
                                        alignment: Alignment.topLeft,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            TimeRange result = await showTimeRangePicker(
                                              hideTimes: false,
                                              clockRotation: 180,
                                              context: context,
                                            );
                                            print("result " + result.toString());
                                            setState(() {
                                              _startEnd = result.endTime.toString();
                                              _startTime = result.startTime.toString();
                                            });
                                          },
                                          child: const Text("Pick start time and end time"),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: 70,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.only(top: 10, ),
                                        decoration: const BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10)
                                            )
                                        ),
                                        child: Column(
                                          children: [
                                            Text("Starting: " +_startTime,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text("Ending:  " + _startEnd,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),


                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ButtonTheme(
                                      minWidth: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {},
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
                                              child: Text("UPDATE TIMECARD",
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
