import 'package:get/get.dart';

import '../controllers/ayat_kursi_controller.dart';

class AyatKursiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AyatKursiController>(
      () => AyatKursiController(),
    );
  }
}
