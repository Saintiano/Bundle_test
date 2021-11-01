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

  var _uploadedFileURL;
  var gravatarUrl;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  var bill_rate_facebook = 100;
  var bill_rate_google = 300;

  var currentDateTime = DateFormat('dd/MM/yyyy HH:mm');

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

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    firebaseUser.bindStream(_auth.authStateChanges());

    // getUsertream(_updateUserProfile)
    //     .then((StreamSubscription s) => _subscriptionuser = s);

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

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
      //await isAdmin();
    }

    if (_firebaseUser == null) {
      print('Send to signin');
      Get.offAll(const Login());
    } else {
      Get.offAll(const Bottom_Nav_Bar());
    }

  }

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    print('streamFirestoreUser()');

    return _db
        .doc('/User_Profiles/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()!));
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _db.doc('/User_Profiles/${firebaseUser.value!.uid}').get().then(
            (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
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
  }

  // User registration using email and password
  Ccomplete_registration(String email, String username, String name,
      String address, String company, String state, String position, String gender,
      String phone_number) async {

    try {
      //get current date time
      var inputDate = currentDateTime.parse('31/12/2000 23:59');

      String userUID = _auth.currentUser!.uid;

      //get photo url from gravatar if user has one

      //create the new user object
      Map<String, String> _newUser = {
        "uid": userUID,
        "email": email,
        "name": name,
        "photoUrl": _uploadedFileURL,
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

    } on FirebaseAuthException catch (error) {

      Get.snackbar('Create account'.tr, error.message!,
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
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _auth.sendPasswordResetEmail(email: email.text);
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
          _uploadedFileURL = value);
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
            _uploadedFileURL = value);

        Get.snackbar("Image upload", "Completed");
      });
      //Single image
    } else {
      Get.snackbar("No Image Selected", "Try again");
    }
  }


  //Get user informations
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

  // void getImage(ImageSource imageSource, String uid) async {
  //   final pickedFile = await ImagePicker().getImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagePath.value = pickedFile.path;
  //     selectedImageSize.value =
  //         ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
  //             .toStringAsFixed(2) +
  //             " Mb";
  //
  //     // Crop
  //     final cropImageFile = await ImageCropper.cropImage(
  //         sourcePath: selectedImagePath.value,
  //         maxWidth: 512,
  //         maxHeight: 512,
  //         compressFormat: ImageCompressFormat.jpg);
  //     cropImagePath.value = cropImageFile!.path;
  //     cropImageSize.value =
  //         ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
  //             .toStringAsFixed(2) +
  //             " Mb";
  //
  //     // Compress
  //
  //     final dir = await Directory.systemTemp;
  //     final targetPath = dir.absolute.path + "/temp.jpg";
  //     var compressedFile = await FlutterImageCompress.compressAndGetFile(
  //         cropImagePath.value,
  //         targetPath, quality: 90);
  //     compressImagePath.value = compressedFile!.path;
  //     compressImageSize.value =
  //         ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
  //             .toStringAsFixed(2) +
  //             " Mb";
  //
  //     uploadImage(compressedFile, uid);
  //
  //   } else {
  //     Get.snackbar('Error', 'No image selected',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white);
  //   }
  // }






}