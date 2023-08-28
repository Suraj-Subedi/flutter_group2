import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        body: GetBuilder<AdminDashboardController>(
          init: AdminDashboardController(),
          builder: (controller) {
            if (controller.stats == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                controller.getStats();
              },
              child: GridView(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  children: [
                    StatsCard(
                      label: 'Total Income',
                      icon: Icon(Icons.money),
                      isAmount: true,
                      value: controller.stats?.totalIncome.toString() ?? '',
                    ),
                    StatsCard(
                      label: 'Total Users',
                      icon: Icon(Icons.person),
                      value: controller.stats?.totalUsers.toString() ?? '',
                    ),
                    StatsCard(
                      label: 'Total Products',
                      value: controller.stats?.totalProducts.toString() ?? '',
                    ),
                    StatsCard(
                      label: 'Total Orders',
                      value: controller.stats?.totalOrders.toString() ?? '',
                    )
                  ]),
            );
          },
        ));
  }
}

class StatsCard extends StatelessWidget {
  final String label;
  final String value;
  final Icon? icon;
  final bool isAmount;
  final Color? color;
  const StatsCard(
      {super.key,
      required this.label,
      required this.value,
      this.isAmount = false,
      this.color,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.2),
            offset: Offset(1, 1))
      ], color: color ?? Color.fromRGBO(242, 242, 242, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            (isAmount ? 'Rs.' : '') + value,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 67, 147, 239),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              icon ?? SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }
}
