import 'package:ecom_2/app/components/My_button.dart';
import 'package:ecom_2/app/model/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_users_controller.dart';

class AdminUsersView extends GetView<AdminUsersController> {
  const AdminUsersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminUsersView'),
        centerTitle: true,
      ),
      body: GetBuilder<AdminUsersController>(
        init: AdminUsersController(),
        builder: (controller) {
          if (controller.users == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView.builder(
                itemCount: controller.users!.length,
                itemBuilder: (context, index) {
                  return UserCard(user: controller.users![index]);
                }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddUserPopup());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName ?? '',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.email ?? '',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                // showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     title: Text('Delete Category'),
                //     content:
                //         Text('Are you sure ,you want to delete this category'),
                //     actions: [
                //       TextButton(
                //         onPressed: () {},
                //         child: Text('Yes'),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           Get.back();
                //         },
                //         child: Text('No'),
                //       ),
                //     ],
                //   ),
                // );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}

class AddUserPopup extends StatelessWidget {
  const AddUserPopup({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AdminUsersController>();
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Admin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controller.nameController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Admin name',
                  hintText: 'Enter admin name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter admin name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controller.emailController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Admin email',
                  hintText: 'Enter admin email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter admin email';
                  } else if (!value.isEmail) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: true,
                controller: controller.passwordController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Admin password',
                  hintText: 'Enter admin initial password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter admin password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              MyButton(tittle: 'Add Admin', onPressed: controller.addUser)
            ],
          ),
        ),
      ),
    );
  }
}
