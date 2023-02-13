// ignore_for_file: constant_identifier_names

import 'package:driver/src/screens/auth/signin/binding.dart';
import 'package:driver/src/screens/auth/signin/screen.dart';
import 'package:driver/src/screens/splash/splash.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
    ),
  ];
}
