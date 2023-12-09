import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bacaan_shalat_controller.dart';

class BacaanShalatView extends GetView<BacaanShalatController> {
  const BacaanShalatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BacaanShalatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BacaanShalatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
