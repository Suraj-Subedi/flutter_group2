import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ThirdView extends GetView {
  const ThirdView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ThirdView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
