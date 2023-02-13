import 'package:driver/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:driver/services/service.auth.dart';
import 'package:driver/src/shared/shared.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: ColorConstants.darkScaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '@todo Ganti Loadingnya',
            style: TextStyle(
                fontSize: 16.0,
                decoration: TextDecoration.none,
                color: ColorConstants.lightGray),
          )
        ],
      ),
    );
  }
}

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    final response = await AuthService.session();

    if (response.isError) {
      Get.toNamed(Routes.LOGIN);
    } else {
      // @todo
      // resave the session

      // redirect to dashboard
    }
  }
}
