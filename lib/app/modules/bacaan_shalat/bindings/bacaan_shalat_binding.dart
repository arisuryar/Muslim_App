import 'package:get/get.dart';

import '../controllers/bacaan_shalat_controller.dart';

class BacaanShalatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BacaanShalatController>(
      () => BacaanShalatController(),
    );
  }
}
