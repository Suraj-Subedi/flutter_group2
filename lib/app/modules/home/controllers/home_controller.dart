import 'package:ecom_2/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late final SharedPreferences prefs;
  final count = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  void onLogout() async {
    await prefs.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }

  void increment() => count.value++;
}
