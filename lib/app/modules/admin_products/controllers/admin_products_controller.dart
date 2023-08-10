import 'dart:typed_data';

import 'package:ecom_2/app/components/addProductPopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductsController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final count = 0.obs;

  XFile? productImage;
  Uint8List? imageBytes;

  void onAdd() {
    showDialog(
        context: Get.context!, builder: (context) => const AddProductPopup());
  }

  void onPickImage() async {
    try {
      productImage = await picker.pickImage(source: ImageSource.gallery);
      imageBytes = await productImage!.readAsBytes();
      update();
    } catch (e) {}
  }

  void increment() => count.value++;
}
