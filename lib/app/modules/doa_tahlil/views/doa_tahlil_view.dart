import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doa_tahlil_controller.dart';

class DoaTahlilView extends GetView<DoaTahlilController> {
  const DoaTahlilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoaTahlilView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DoaTahlilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
