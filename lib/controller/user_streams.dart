import 'dart:async';
import 'package:bundle_test/models/read_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseUserStream {
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

}
