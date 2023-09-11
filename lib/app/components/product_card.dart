import 'package:ecom_2/app/constants.dart';
import 'package:ecom_2/app/model/product.dart';
import 'package:ecom_2/app/modules/cart/controllers/cart_controller.dart';
import 'package:ecom_2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    var isFavourtie = false.obs;
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAILED_PRODUCT, arguments: product);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ]),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: 'product+${product.productId}',
                    child: Image.network(
                      getImageUrl(
                        product.imageUrl,
                      ),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                product.title?.toUpperCase() ?? '',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rs${product.price ?? ''}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    cartController.addProduct(product: product);
                                  },
                                  child: const Icon(Icons.add_shopping_cart))
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
                onPressed: () {
                  isFavourtie.value = !isFavourtie.value;
                },
                icon: Obx(
                  () => Icon(
                    isFavourtie.value ? Icons.favorite : Icons.favorite_outline,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
