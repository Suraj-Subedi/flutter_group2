import 'package:ecom_2/app/modules/admin_products/controllers/admin_products_controller.dart';
import 'package:ecom_2/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPopup extends StatelessWidget {
  const AddProductPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminProductsController>(
      builder: (controller) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeController>(
                  builder: (controller) => controller.categories == null
                      ? const CircularProgressIndicator()
                      : DropdownButtonFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          hint: const Text('Select Category'),
                          items: controller.categories!
                              .map((category) => DropdownMenuItem(
                                    value: category.categoryId,
                                    child: Text(category.categoryTitle ?? ''),
                                  ))
                              .toList(),
                          onChanged: (v) {
                            controller.selectedCategory = v;
                          })),
              const SizedBox(
                height: 16,
              ),
              controller.productImage == null || controller.imageBytes == null
                  ? ElevatedButton(
                      onPressed: controller.onPickImage,
                      child: const Text('Upload Image'))
                  : Image.memory(controller.imageBytes!)
            ],
          ),
        ),
      ),
    );
  }
}
