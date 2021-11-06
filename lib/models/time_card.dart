import 'package:cloud_firestore/cloud_firestore.dart';

class Timecard {

  String? uid;
  late String email;
  late String name;
  late String photoUrl;

  late String username;
  late String company;
  late String position;
  late String phone_number;
  late String date_of_registration;

  late String state;
  late String address;
  late String gender;
  late String total_hours_worked;
  late String total_revenue_generated;
  late String active;

  late String billable_rate;
  late String project_name;
  late String date_created;
  late String date_worked;
  late String time_started;
  late String time_finished;
  late String total_time_worked;
  late String revenue_generated;
  late String sortData;
  late String docId;

  Timecard({
    required this.email,
    required this.name,
    required this.username,
    required this.company,
    required this.position,
    required this.phone_number,
    required this.date_of_registration,
    required this.state,
    required this.address,
    required this.gender,
    required this.total_hours_worked,
    required this.total_revenue_generated,
    required this.active,
    required this.billable_rate,
    required this.project_name,
    required this.date_created,
    required this.date_worked,
    required this.time_started,
    required this.time_finished,
    required this.total_time_worked,
    required this.revenue_generated,
    required this.sortData,
    required this.docId,

  });

  Timecard.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {

    uid = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    username = documentSnapshot["username"];
    company = documentSnapshot["company"];
    position = documentSnapshot["position"];
    phone_number = documentSnapshot["phone_number"];
    date_of_registration = documentSnapshot["date_of_registration"];
    state = documentSnapshot["total_hours_worked"];
    address = documentSnapshot["address"];
    gender = documentSnapshot["gender"];
    total_hours_worked = documentSnapshot["gender"];

    total_revenue_generated = documentSnapshot["total_revenue_generated"];
    active = documentSnapshot["active"];
    billable_rate = documentSnapshot["billable_rate"];

    project_name = documentSnapshot["project_name"];
    date_created = documentSnapshot["date_created"];
    date_worked = documentSnapshot["date_worked"];
    time_started = documentSnapshot["time_started"];
    time_finished = documentSnapshot["time_finished"];

    total_time_worked = documentSnapshot["total_time_worked"];
    revenue_generated = documentSnapshot["revenue_generated"];
    sortData = documentSnapshot["sortData"];
    docId = documentSnapshot["docId"];

  }
}
