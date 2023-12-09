import 'package:get/get.dart';

import '../controllers/doa_tahlil_controller.dart';

class DoaTahlilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaTahlilController>(
      () => DoaTahlilController(),
    );
  }
}
