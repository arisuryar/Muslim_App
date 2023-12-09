import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/niat_shalat_controller.dart';

class NiatShalatView extends GetView<NiatShalatController> {
  const NiatShalatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NiatShalatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NiatShalatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
