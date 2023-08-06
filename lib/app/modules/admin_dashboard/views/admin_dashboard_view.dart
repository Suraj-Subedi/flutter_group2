import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminDashboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
