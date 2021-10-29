import 'package:bundle_test/components/rounded_back_button.dart';
import 'package:bundle_test/constants/data.dart';
import 'package:bundle_test/views/account/setup_completed.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {

  final TextEditingController _verify = TextEditingController();

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
              color: Colors.blueGrey,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: const Text(
          "Edit user profile",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black38
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.blueGrey,
            ),
            onPressed: () {

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
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 4,
                                                    color: Theme.of(context).scaffoldBackgroundColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      color: Colors.black.withOpacity(0.1),
                                                      offset: const Offset(0, 10))
                                                ],
                                                shape: BoxShape.circle,
                                                image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage("assets/images/clovis_novo.jpg"),
                                                )
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text("Tap image to select profile image",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextField(
                                        controller: _verify,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                          ),

                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),

                                          labelText: 'Full Name',
                                        ),
                                        onSubmitted: (String value) async {
                                          await showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Thanks!'),
                                                content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () { Navigator.pop(context); },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: _verify,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                          ),

                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),

                                          labelText: 'Email',
                                        ),
                                        onSubmitted: (String value) async {
                                          await showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Thanks!'),
                                                content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () { Navigator.pop(context); },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: _verify,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                          ),

                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),

                                          labelText: 'Username',
                                        ),
                                        onSubmitted: (String value) async {
                                          await showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Thanks!'),
                                                content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () { Navigator.pop(context); },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: _verify,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                          ),

                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),

                                          labelText: 'Company name',
                                        ),
                                        onSubmitted: (String value) async {
                                          await showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Thanks!'),
                                                content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () { Navigator.pop(context); },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: _verify,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                          ),

                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),

                                          labelText: 'Position',
                                        ),
                                        onSubmitted: (String value) async {
                                          await showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Thanks!'),
                                                content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () { Navigator.pop(context); },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: _verify,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.purple, width: 0.9),
                                          ),

                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),

                                          labelText: 'Phone number',
                                        ),
                                        onSubmitted: (String value) async {
                                          await showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Thanks!'),
                                                content: Text ('You typed "$value", which has length ${value.characters.length}.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () { Navigator.pop(context); },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ///Menu Mode with no searchBox
                                      DropdownSearch<String>(
                                        validator: (v) => v == null ? "required field" : null,
                                        hint: "Select a gender",
                                        mode: Mode.MENU,
                                        showSelectedItem: true,
                                        items: gender,
                                        label: "Select a gender *",
                                        showClearButton: true,
                                        onChanged: print,
                                        popupItemDisabled: (String? s) => s?.startsWith('Z') ?? false, //Deactivate any option starting with letter Z
                                        clearButtonSplashRadius: 20,
                                        selectedItem: "Select a gender",//Preselected data
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

                                      ///BottomSheet Mode with searchBox
                                      DropdownSearch<String>(
                                        mode: Mode.BOTTOM_SHEET,
                                        items: stateData,
                                        label: "Select a state",
                                        onChanged: print,
                                        selectedItem: "Abia",
                                        showSearchBox: true,
                                        searchFieldProps: TextFieldProps(
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                                            labelText: "Search a state",
                                          ),
                                        ),
                                        popupTitle: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColorDark,
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Pick a state',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        popupShape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(24),
                                            topRight: Radius.circular(24),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  ButtonTheme(
                                      minWidth: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(()=> const Setup_Completed());
                                        },
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
                                              child: Text("UPDATE PROFILE",
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
