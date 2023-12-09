import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doa_harian_controller.dart';

class DoaHarianView extends GetView<DoaHarianController> {
  const DoaHarianView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoaHarianView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DoaHarianView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
