

import 'package:bundle_test/models/timecard_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';

class Crud_Logic extends GetxController{

  final TextEditingController total_time_worked = TextEditingController();
  final TextEditingController project_name = TextEditingController();


  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<TimecardModel> projectTimecards = RxList<TimecardModel>([]);

  late DatabaseReference _userProfiles;

  var bill_rate_facebook = 100;
  var bill_rate_google = 300;
  var billable_rate = 0;
  var user_total_revenue_generated = 0;
  var user_total_revenue_generated_removed = 0;
  var revenue_generated = 0;
  var totalTimeWorkedProject_new = 0;
  var revenue_generated_removed = 0;
  var totalTimeWorkedProject_removed = 0;

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');


  var startTime = "".obs;
  var startEnd = "".obs;

  DateTime selectedDate = DateTime.now();

  var pickedDate = "date".obs;

  Future<void> selectTime(BuildContext context) async{
    TimeRange result = await showTimeRangePicker(
      hideTimes: false,
      clockRotation: 180,
      context: context,
    );

    print("result " + result.toString());

    startEnd.value = result.endTime.toString();
    startTime.value = result.startTime.toString();

  }

  Future<void> selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if(picked != null && picked != selectedDate){

      //convert picked date to local time
      selectedDate = picked.toLocal();

      //convert picked date to string and assign picked date to Obx variable pickedDate
      pickedDate.value = selectedDate.toString();

    }

  }

  @override
  void onReady() {

    projectTimecards.bindStream(getAllProjectTimecards());
  }


  @override
  void onInit() {
    super.onInit();

  }

//stream timecards to list
  Stream<List<TimecardModel>> getAllProjectTimecards() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => TimecardModel.fromMap(item)).toList());


  @override
  void onClose() {
    total_time_worked.dispose();
    project_name.dispose();
  }

  void clearEditingControllers() {
    total_time_worked.clear();
    project_name.clear();
  }

  
  //calculate generated revenue par project worked on
  void calculateRevenuePerProject(String timeWorked, String productBillerRate){

    var time = int.parse(timeWorked);

    if( productBillerRate == 'Facebook' ){

      revenue_generated = time * bill_rate_facebook;
      billable_rate = bill_rate_facebook;

    }else{

      revenue_generated = time * bill_rate_google;
      billable_rate = bill_rate_google;

    }

  }

  //calculate total generated revenue for projects worked on
  void calculateTotalRevenue(int revenue_generated, String total_revenue_generated){

    var previouse_revenue = int.parse(total_revenue_generated);

    user_total_revenue_generated = previouse_revenue + revenue_generated;

    print(user_total_revenue_generated);

  }

  //calculate total time worked on
  void calculateTotalTimeWorked(String total_time_worked, String total_hours_worked){

    var timeWorkedProject = int.parse(total_time_worked);
    var totalTimeWorkedProject = int.parse(total_hours_worked);

    totalTimeWorkedProject_new = timeWorkedProject + totalTimeWorkedProject;

    print(totalTimeWorkedProject_new);

  }

  //create and update timecards
  void saveUpdateTimecard(String uid, String email, String name,
      String photoUrl, String username, String company, String position, String phone_number, String date_of_registration,
      String state, String address, String gender, String total_hours_worked, String total_revenue_generated, String active,
      String project_name, String date_worked, String time_started, String time_finished,
      String total_time_worked, int addEditFlag) {

    //get current date time
    final String formattedCurrentTime = formatter.format(now);
    String _sortTime = DateTime.now().microsecondsSinceEpoch.toString();

    //document reference id
    String documentId = username+_sortTime.toString();

    //calculate generated revenue par project worked on
    calculateRevenuePerProject(total_time_worked, project_name);
    //calculate total time worked on
    calculateTotalTimeWorked(total_time_worked, total_hours_worked);

    calculateTotalRevenue(revenue_generated, total_revenue_generated);

    collectionReference  = firebaseFirestore.collection("Project_Timecards");

    //update user profile details
    _userProfiles = FirebaseDatabase.instance.reference().child('Project_Timecards');

    //create the new user object
    Map<String, String> timecardInformations = {
      "uid": uid,
      "email": email,
      "name": name,
      "photoUrl": photoUrl,

      "username": username,
      "company": company,
      "position": position,
      "phone_number": phone_number,
      "date_of_registration": date_of_registration,
      "state": state,
      "address": address,
      "gender": gender,
      "total_hours_worked": total_hours_worked,
      "total_revenue_generated": user_total_revenue_generated.toString(),
      "active": active,
      "product_id": documentId,
      "billable_rate": billable_rate.toString(),
      "date_created": formattedCurrentTime,
      "date_worked": date_worked,
      "time_started": time_started,
      "time_finished": time_finished,
      "total_time_worked": totalTimeWorkedProject_new.toString(),
      "sortData": _sortTime,
      "revenue_generated": revenue_generated.toString(),
    };


    //update the user object
    Map<String, String> timecardInformationsUpdateUser = {
      "uid": uid,
      "total_hours_worked": totalTimeWorkedProject_new.toString(),
      "total_revenue_generated": user_total_revenue_generated.toString(),
    };

    print(uid);
    print(documentId);
    print(timecardInformations);

    if (addEditFlag == 1) {

      collectionReference
          .doc(uid).collection(username).doc(documentId)
          .set(timecardInformations).whenComplete(() {

        //clear editing controllers
        _updateUserFirestore(timecardInformationsUpdateUser, uid);

        clearEditingControllers();
        Get.back();

        Get.snackbar("Creating project timecard", "Successful",
          backgroundColor: Colors.green,
        );

      }).catchError((error) {

        Get.snackbar("Error creating project timecard", error.toString(),
          backgroundColor: Colors.red,
        );

      });

    } else if (addEditFlag == 2) {
      //update timecards

      collectionReference
          .doc(uid).collection(username).doc(documentId)
          .update(timecardInformations).whenComplete(() {

        //clear editing controllers
        _updateUserFirestore(timecardInformationsUpdateUser, uid);

        clearEditingControllers();

        Get.back();

        Get.snackbar("Updating project timecard", "Successful",
          backgroundColor: Colors.green,
        );

      }).catchError((error) {

        Get.snackbar("Error updating project timecard", error.toString(),
          backgroundColor: Colors.red,
        );

      });
    }
  }

  //create the firestore user in users collection
  void _updateUserFirestore(Map<String, String> userdata, String uid) {
    FirebaseFirestore.instance
        .collection("User_Profiles")
        .doc(uid)
        .update(userdata);

    _userProfiles.child(uid).update(userdata);

  }

  //Deleting project timecard
  void deleteData(String uid, String username, String documentId, String project_name, String total_hours_worked,
      String total_time_worked, String revenue_generated, String total_revenue_generated) {

    //Recalculate generated revenue par project worked on after deletion
    calculateTotalTimeWorkedRemoved(total_hours_worked, total_time_worked);
    //Recalculate total time worked on after deletion
    calculateDeletedRevenue(total_time_worked, project_name);
    //Recalculate total generated revenue for projects worked on
    calculateTotalRevenueRemoved(revenue_generated, total_revenue_generated);

    //update the user object
    Map<String, String> timecardInformationsUpdateUser = {
      "uid": uid,
      "total_hours_worked": totalTimeWorkedProject_removed.toString(),
      "total_revenue_generated": revenue_generated_removed.toString(),
    };

    collectionReference.doc(uid).collection(username).doc(documentId).delete().whenComplete(() {

      _updateUserFirestore(timecardInformationsUpdateUser, uid);

      Get.snackbar("Project Timecard Updated", "Successful",
        backgroundColor: Colors.green,
      );

      Get.back();

      Get.snackbar("Project Timecard Deleting", "Successful",
        backgroundColor: Colors.green,
      );

    }).catchError((error) {

      Get.snackbar("Error deleting project timecard", error.toString(),
        backgroundColor: Colors.red,
      );

    });

  }

  //Recalculate generated revenue par project worked on after deletion
  void calculateDeletedRevenue(String timeWorked, String productBillerRate){

    var time = int.parse(timeWorked);

    if( productBillerRate == 'Facebook' ){

      revenue_generated_removed = time ~/ bill_rate_facebook;

    }else{

      revenue_generated_removed = time ~/ bill_rate_google;

    }

  }

  //Recalculate total generated revenue for projects worked on
  void calculateTotalRevenueRemoved(String revenue_generated, String total_revenue_generated){

    var previouse_revenue = int.parse(total_revenue_generated);
    var new_revenue = int.parse(revenue_generated);

    user_total_revenue_generated_removed = previouse_revenue - new_revenue;

  }

  //Recalculate total time worked on after deletion
  void calculateTotalTimeWorkedRemoved( String totalTimeWorked, String timeWorked){

    var timeWorkedProject = int.parse(timeWorked);
    var totalTimeWorkedProject = int.parse(totalTimeWorked);

    totalTimeWorkedProject_removed =  totalTimeWorkedProject - timeWorkedProject;

  }


}