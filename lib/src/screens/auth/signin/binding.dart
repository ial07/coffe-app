import 'package:get/get.dart';

import 'controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
  }
}
