

import 'package:bundle_test/controller/firebase_controller.dart';
import 'package:get/instance_manager.dart';

import '../logic_controller.dart';

class Controler_Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Firebase_Controller>(() => Firebase_Controller());
    Get.lazyPut<Crud_Logic>(() => Crud_Logic());
  }

}