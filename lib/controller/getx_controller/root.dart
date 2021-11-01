import 'package:bundle_test/components/bottom_nav_bar.dart';
import 'package:bundle_test/controller/firebase_controller.dart';
import 'package:bundle_test/views/account/login.dart';
import 'package:bundle_test/views/dashboard.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Root extends GetWidget<Firebase_Controller> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx((){
      return (Get.find<Firebase_Controller>().user != null) ? const Bottom_Nav_Bar() : const Login();
    });
    throw UnimplementedError();
  }

}