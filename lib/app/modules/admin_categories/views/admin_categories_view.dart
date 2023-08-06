import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_categories_controller.dart';

class AdminCategoriesView extends GetView<AdminCategoriesController> {
  const AdminCategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminCategoriesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminCategoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
