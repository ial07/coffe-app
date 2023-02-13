import 'package:driver/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SigninScreen extends GetView<SigninController> {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 100),
          child: Form(
            key: controller.formSigninKey,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Obx(
                  () => InputForm(
                    Controller: controller.username,
                    HintText: "masukan username anda",
                    textError: controller.error["username"],
                  ),
                ),
                Obx(
                  () => InputForm(
                    Controller: controller.password,
                    HintText: "masukan password anda",
                    textError: controller.error["password"],
                  ),
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () async {
                      if (controller.isLoading.isFalse) {
                        await controller.doLogin();
                      }
                    },
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightBlue,
                            Colors.lightBlue.shade200,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(5, 5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          controller.isLoading.isFalse ? "MASUK" : "LOADING...",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  //  _buildForm(BuildContext context) {
  //   return
  // }
}
