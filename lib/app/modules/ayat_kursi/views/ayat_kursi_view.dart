import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ayat_kursi_controller.dart';

class AyatKursiView extends GetView<AyatKursiController> {
  const AyatKursiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AyatKursiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AyatKursiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
