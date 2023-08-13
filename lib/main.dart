import 'package:ecom_2/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecom_2/app/utils/memoryManagement.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  // Get.put(LoginController(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // var token = prefs.getString('token');
  // var role = prefs.getString('role');
  Get.put(CartController(), permanent: true);
  var token = MemoryManagement.getAccessToken();
  var role = MemoryManagement.getAccessRole();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: token != null
          ? (role != null && role == 'admin')
              ? Routes.ADMIN_MAIN
              : Routes.MAIN
          : AppPages.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
