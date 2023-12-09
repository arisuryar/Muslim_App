import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/asmaul_husna_controller.dart';

class AsmaulHusnaView extends GetView<AsmaulHusnaController> {
  const AsmaulHusnaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsmaulHusnaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AsmaulHusnaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
