import 'package:get/get.dart';

double textSize(double baseSize) {
  final textScaleFactor = Get.textScaleFactor;

  // Mengalikan ukuran font dengan faktor skala
  return baseSize * textScaleFactor;
}
