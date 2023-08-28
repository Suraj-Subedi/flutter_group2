import 'package:ecom_2/app/components/My_button.dart';
import 'package:ecom_2/app/constants.dart';
import 'package:ecom_2/app/model/product.dart';
import 'package:ecom_2/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailed_product_controller.dart';

class DetailedProductView extends GetView<DetailedProductController> {
  const DetailedProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product = Get.arguments as Product;
    var cartController = Get.find<CartController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(product.title?.toUpperCase() ?? ''),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  width: double.infinity,
                  height: Get.height * 0.4,
                  getImageUrl(product.imageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title?.toUpperCase() ?? '',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        product.description ?? '',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Rs.' + product.price.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (controller.quantity > 1) {
                        controller.quantity--;
                      }
                    },
                    icon: Icon(Icons.remove)),
                Obx(
                  () => Text(
                    controller.quantity.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.quantity++;
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
            MyButton(
              tittle: 'Add to Cart',
              onPressed: () {
                cartController.addProduct(
                    product: product, quantity: controller.quantity.value);
              },
            )
          ],
        ));
  }
}
