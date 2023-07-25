import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  // Get.put(LoginController(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();
  // await MemoryManagement.init();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: token != null ? AppPages.HOME : AppPages.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
