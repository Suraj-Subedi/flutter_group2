import 'package:ecom_2/app/components/My_button.dart';
import 'package:ecom_2/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FirstView extends GetView {
  const FirstView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OnboardingController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('FirstView'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyButton(
              tittle: 'Next page 2',
              onPressed: controller.nextPage,
            ),
            SizedBox(
              height: Get.height * 0.1,
            )
          ],
        ));
  }
}
