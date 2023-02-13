// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:driver/services/models.dart';
import 'package:driver/services/services.dart';
import 'package:driver/src/shared/controller/form.dart';

class SigninController extends GetxController with FormController {
  final GlobalKey<FormState> formSigninKey = GlobalKey<FormState>();

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  RxBool passwordVisible = false.obs;

  Future<void> doLogin() async {
    formStarted();

    var response = await AuthService.signin(SigninRequest(
      username: username.text,
      password: password.text,
      app: "tms",
    ));

    if (!response.isError) {
      // handle success
      var session = response.data as Session;
      //
    }

    formEnded(response);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
