import 'package:ecom_2/app/components/My_button.dart';
import 'package:ecom_2/app/routes/app_pages.dart';
import 'package:ecom_2/app/utils/memoryManagement.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          centerTitle: true,
        ),
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            if (controller.user == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Text(
                    (controller.user?.fullName?[0].toUpperCase() ?? '') +
                        (controller.user?.fullName?[1].toUpperCase() ?? ''),
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.user?.fullName?.toUpperCase() ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.user?.email ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  MemoryManagement.getAccessRole()?.toUpperCase() ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    tittle: 'Logout',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text(
                            'Are you sure you want to logout?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                MemoryManagement.removeAll();
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      // MemoryManagement.removeAll();
                      // Get.offAllNamed(Routes.LOGIN);
                    })
              ],
            );
          },
        ));
  }
}
