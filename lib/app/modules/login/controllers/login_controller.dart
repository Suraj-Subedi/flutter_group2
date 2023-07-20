import 'package:ecom_2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void increment() {
    count.value++;
  }

  void onLogin() {
    if (loginFormKey.currentState!.validate()) {
      Get.toNamed(Routes.REGISTER);
    }
  }
}
