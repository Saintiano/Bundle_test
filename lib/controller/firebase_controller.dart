import 'dart:async';
import 'dart:io';

import 'package:bundle_test/components/bottom_nav_bar.dart';
import 'package:bundle_test/components/loading.dart';
import 'package:bundle_test/models/read_user.dart';
import 'package:bundle_test/models/user_model.dart';
import 'package:bundle_test/views/account/complete_setup.dart';
import 'package:bundle_test/views/account/login.dart';
import 'package:bundle_test/views/account/setup_completed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Firebase_Controller extends GetxController{

  //Image picker
  List<File> _imageMutiplePicked = [];
  late File _singleImage;
  late PickedFile pickedFile;

  var uploadedFileURL;

  var bill_rate_facebook = 100;
  var bill_rate_google = 300;

  var currentDateTime = DateFormat('dd/MM/yyyy HH:mm');



  late StreamSubscription _subscriptionuser;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController company = TextEditingController();
  final TextEditingController position = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  final TextEditingController gender= TextEditingController();
  final TextEditingController total_hours_worked = TextEditingController();
  final TextEditingController project_name = TextEditingController();
  final TextEditingController time_finished = TextEditingController();
  final TextEditingController time_started = TextEditingController();
  final TextEditingController date_created = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  late DatabaseReference _userProfiles;

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  @override
  void onInit() {
    // TODO: implement onInit
    firebaseUser.bindStream(_auth.authStateChanges());

    super.onInit();
  }

  @override
  void onClose() {

    email.dispose();
    password.dispose();
    username.dispose();
    state.dispose();
    address.dispose();
    phoneNumber.dispose();

    gender.dispose();
    total_hours_worked.dispose();
    project_name.dispose();
    time_finished.dispose();
    time_started.dispose();
    date_created.dispose();

    super.onClose();
  }

  // User registration using email and password
  registerWithEmailAndPassword(String email, String password, String username) async {

    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: email, password: password)
          .then((result) async {
        //get current date time
        var inputDate = currentDateTime.parse('31/12/2000 23:59');

        print('uID: ' + result.user!.uid.toString());
        print('email: ' + result.user!.email.toString());

        var _uid = result.user!.uid.toString();
        var _email = result.user!.email.toString();

        _userProfiles = FirebaseDatabase.instance.reference().child('User_Profiles');

        //get photo url from gravatar if user has one

        //create the new user object
        Map<String, String> _newUser = {
          "uid": _uid,
          "email": _email,
          "username": username,
          "date_of_registration": inputDate.toString(),
        };

        //create the user in firestore
        _createUserFirestore(_newUser, _uid);

        Get.to(()=> const Complete_Setup());

      });
    } on FirebaseAuthException catch (error) {

      Get.snackbar('Create account'.tr, error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //create the firestore user in users collection
  void _createUserFirestore(Map<String, String> userdata, String uid) {
    FirebaseFirestore.instance
        .collection("User_Profiles")
        .doc(uid)
        .set(userdata);

    _userProfiles.child(uid).set(userdata);

  }

  // User registration using email and password
  Ccomplete_registration(String email, String username, String name,
      String address, String company, String state, String position, String gender,
      String phone_number) async {

    try {
      //get current date time
      var inputDate = currentDateTime.parse('31/12/2000 23:59');

      String userUID = _auth.currentUser!.uid;

      _userProfiles = FirebaseDatabase.instance.reference().child('User_Profiles');

      //get photo url from gravatar if user has one
      if(uploadedFileURL == ""){
        Get.snackbar('Complete account details'.tr," Please upload an image!",
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 10),
            backgroundColor: Get.theme.snackBarTheme.backgroundColor,
            colorText: Get.theme.snackBarTheme.actionTextColor);
      }else{

        //create the new user object
        Map<String, String> _newUser = {
          "uid": userUID,
          "email": email,
          "name": name,
          "photoUrl": uploadedFileURL,
          "address": address,
          "company": company,
          "state": state,
          "position": position,
          "gender": gender,
          "total_hours_worked": '',
          "active": '',
          "total_revenue_generated": '',
          "username": username,
          "phone_number": phone_number,
          "date_of_registration": inputDate.toString(),
        };
        //create the user in firestore
        _updateUserFirestore(_newUser, userUID);

        Get.to(()=> const Setup_Completed());

      }


    } on FirebaseAuthException catch (error) {

      Get.snackbar('Complete account details'.tr, error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
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

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(String email, String password) async {

    try {
      await _auth.signInWithEmailAndPassword(
          email:email.trim(),
          password: password.trim());

      Get.to(()=> const Bottom_Nav_Bar());
      Get.snackbar("Welcome to Bundle", email);

    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar('auth.signInErrorTitle'.tr, 'auth.signInError'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }



  //password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    showLoadingIndicator();
    try {
      await _auth.sendPasswordResetEmail(email: email);
      hideLoadingIndicator();
      Get.snackbar(
          'Password Reset'.tr, 'Please check your email'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on FirebaseAuthException catch (error) {
      hideLoadingIndicator();
      Get.snackbar('Password Reset Failed'.tr, error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // Sign user out
  Future<void> signOut() {
    name.clear();
    email.clear();
    password.clear();
    return _auth.signOut();
  }

  void uploadImage(File file, String uid) async {

    Get.dialog(Center(child: CircularProgressIndicator(),),
      barrierDismissible: false,);

    FirebaseStorage storage =
        FirebaseStorage.instance;
    Reference ref = storage
        .ref()
        .child(uid)
        .child("image1" +
        DateTime.now().toString());
    UploadTask uploadTask =
    ref.putFile(file);
    await uploadTask.whenComplete(() async {
      await ref.getDownloadURL().then(
              (value) =>
              uploadedFileURL = value);
    });
  }

  Future getImage2(ImageSource imageSource) async {

    ImagePicker picker = ImagePicker();

    //Let user select the picture from the gallery
    final pickedFiles = await picker.getImage(source: ImageSource.gallery);
    pickedFile = pickedFiles!;


    if (pickedFile != null) {

      _imageMutiplePicked.add(File(pickedFile.path)); //multiple images
      _singleImage = File(pickedFile.path);

      String userUID = _auth.currentUser!.uid;

      Get.snackbar("Image upload", "Started");
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );

      FirebaseStorage storage =
          FirebaseStorage.instance;
      Reference ref = storage
          .ref()
          .child(userUID)
          .child("image1" +
          DateTime.now().toString());
      UploadTask uploadTask =
      ref.putFile(_singleImage);
      await uploadTask.whenComplete(() async {
        await ref.getDownloadURL().then(
                (value) =>
                uploadedFileURL = value);

        Get.snackbar("Image upload", "Completed");
      });
      //Single image
    } else {
      Get.snackbar("No Image Selected", "Try again");
    }
  }


}