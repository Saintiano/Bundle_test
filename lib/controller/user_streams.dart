import 'dart:async';
import 'package:bundle_test/models/read_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseUserStream {

  var profile_uid = "";
  var profile_email = "";
  var profile_name = "";
  var profile_photoUrl = "";

  var profile_username = "";
  var profile_company = "";
  var profile_position = "";
  var profile_phone_number = "";
  var profile_date_of_registration = "";

  var profile_state = "";
  var profile_address = "";
  var profile_gender = "";
  var profile_total_hours_worked = "";
  var profile_total_revenue_generated = "";
  var profile_active = "";

  var profile_billable_rate = "";
  var profile_project_name = "";
  var profile_date_created = "";
  var profile_date_worked = "";
  var profile_time_started = "";
  var profile_time_finished = "";
  var profile_total_time_worked = "";
  var profile_revenue_generated = "";


  /// FirebaseTodos.getTodo("-KriJ8Sg4lWIoNswKWc4").then(_updateTodo);
  static Future<UserData> getUser() async {
    Completer<UserData> completer = new Completer<UserData>();

    FirebaseAuth _auth = FirebaseAuth.instance;
    String userUID = _auth.currentUser!.uid;

    FirebaseDatabase.instance
        .reference()
        .child("User_Profiles")
        .child(userUID)
        .once()
        .then((DataSnapshot snapshot) {
      var userData = new UserData.fromJson(snapshot.key, snapshot.value);
      completer.complete(userData);
    });

    return completer.future;
  }

  /// FirebaseTodos.getTodoStream("-KriJ8Sg4lWIoNswKWc4", _updateTodo)
  /// .then((StreamSubscription s) => _subscriptionTodo = s);
  static Future<StreamSubscription<Event>> getUsertream(
      void onData(UserData user)) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String userUID = _auth.currentUser!.uid;

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("User_Profiles")
        .child(userUID)
        .onValue
        .listen((Event event) {
      var userData =
      new UserData.fromJson(event.snapshot.key, event.snapshot.value);
      onData(userData);
    });

    return subscription;
  }

  _updateUserProfile(UserData value) {
    var name = value.name;
    var email = value.email;
    var photoUrl = value.photoUrl;

    var username = value.username;
    var company = value.company;
    var position = value.position;
    var phone_number = value.phone_number;
    var date_of_registration = value.date_of_registration;

    var state = value.state;
    var address = value.address;
    var gender = value.gender;
    var total_hours_worked = value.total_hours_worked;
    var total_revenue_generated = value.total_revenue_generated;
    var active = value.active;
    var userId = value.userId;


    profile_uid = userId;
    profile_email = email;
    profile_name = name;
    profile_photoUrl = photoUrl;

    profile_username = username;
    profile_company = company;
    profile_position = position;
    profile_phone_number = phone_number;
    profile_date_of_registration = date_of_registration;

    profile_state = state;
    profile_address = address;
    profile_gender = gender;
    profile_total_hours_worked = total_hours_worked;
    profile_total_revenue_generated = total_revenue_generated;
    profile_active = active;

  }

}
