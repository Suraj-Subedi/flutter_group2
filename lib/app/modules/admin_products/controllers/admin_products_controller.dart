import 'dart:typed_data';

import 'package:ecom_2/app/components/addProductPopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductsController extends GetxController {
  void onAdd() {
    showDialog(
        context: Get.context!, builder: (context) => const AddProductPopup());
  }
}
