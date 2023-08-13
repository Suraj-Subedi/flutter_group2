import 'package:ecom_2/app/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CartView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: controller.cart.length,
              itemBuilder: (context, index) => CartCard(
                    cartItem: controller.cart[index],
                  )),
        ));
  }
}

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  const CartCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]),
      margin: const EdgeInsets.only(bottom: 20),
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              getImageUrl(cartItem.product.imageUrl),
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          )
        ],
      ),
    );
  }
}
