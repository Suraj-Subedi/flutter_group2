import 'package:ecom_2/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartItem> cart = [];

  void addProduct({required Product product, int? quantity}) {
    cart.add(CartItem(product: product, quantity: quantity));
    update();
    Get.showSnackbar(const GetSnackBar(
      backgroundColor: Colors.green,
      message: 'Product added successfully!',
      duration: Duration(seconds: 3),
    ));
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

class CartItem {
  final Product product;
  final int? quantity;

  CartItem({required this.product, this.quantity = 1});
}
