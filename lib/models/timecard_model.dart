//Timecard Model
import 'package:cloud_firestore/cloud_firestore.dart';

class TimecardModel {
  final String uid;
  final String email;
  final String name;
  final String photoUrl;

  final String username;
  final String company;
  final String position;
  final String phone_number;
  final String date_of_registration;

  final String state;
  final String address;
  final String gender;
  final String total_hours_worked;
  final String total_revenue_generated;
  final String active;

  final String billable_rate;
  final String project_name;
  final String date_created;
  final String date_worked;
  final String time_started;
  final String time_finished;
  final String total_time_worked;
  final String revenue_generated;
  final String sortData;

  TimecardModel(
      {

        required this.uid,
        required this.email,
        required this.name,
        required this.photoUrl,

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
        required this.sortData

      });

  factory TimecardModel.fromMap(DocumentSnapshot data) {

    return TimecardModel(

      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',

      username: data['username'] ?? '',
      position: data['position'] ?? '',
      phone_number: data['phone_number'] ?? '',
      gender: data['gender'] ?? '',
      date_of_registration: data['date_of_registration'] ?? '',
      state: data['state'] ?? '',
      total_revenue_generated: data['total_revenue_generated'] ?? '',
      address: data['address'] ?? '',
      company: data['company'] ?? '',
      total_hours_worked: data['total_hours_worked'] ?? '',
      active: data['active'] ?? '',

      billable_rate: data['billable_rate'] ?? '',
      project_name: data['project_name'] ?? '',
      date_created: data['date_created'] ?? '',
      date_worked: data['date_worked'] ?? '',
      time_started: data['time_started'] ?? '',
      time_finished: data['time_finished'] ?? '',
      total_time_worked: data['total_time_worked'] ?? '',
      revenue_generated: data['revenue_generated'] ?? '',
      sortData: data['sortData'] ?? '',

    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "name": name, "photoUrl": photoUrl,

        "position": position, "phone_number": phone_number, "gender": gender, "date_of_registration": date_of_registration,
        "state": state, "total_revenue_generated": total_revenue_generated, "address": address, "company": company,
        "total_hours_worked": total_hours_worked, "active": active,"username": username,

        "billable_rate": billable_rate, "project_name": project_name, "date_created": date_created, "date_worked": date_worked,
        "time_started": time_started, "time_finished": time_finished, "total_time_worked": total_time_worked, "revenue_generated": revenue_generated,
        "sortData": sortData,
      };

}

