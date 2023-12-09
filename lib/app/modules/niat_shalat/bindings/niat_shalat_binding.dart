import 'package:get/get.dart';

import '../controllers/niat_shalat_controller.dart';

class NiatShalatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NiatShalatController>(
      () => NiatShalatController(),
    );
  }
}
