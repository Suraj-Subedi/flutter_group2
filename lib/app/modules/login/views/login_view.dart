import 'package:ecom_2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image(image: NetworkImage(''))
                  Image.network(
                    'https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      hintText: 'Enter your email address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be atleast 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: controller.onLogin,
                    child: const SizedBox(
                      height: 50,
                      child: Center(
                        child: Text('Login'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
