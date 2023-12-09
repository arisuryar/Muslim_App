import 'package:get/get.dart';

import '../modules/asmaul_husna/bindings/asmaul_husna_binding.dart';
import '../modules/asmaul_husna/views/asmaul_husna_view.dart';
import '../modules/ayat_kursi/bindings/ayat_kursi_binding.dart';
import '../modules/ayat_kursi/views/ayat_kursi_view.dart';
import '../modules/bacaan_shalat/bindings/bacaan_shalat_binding.dart';
import '../modules/bacaan_shalat/views/bacaan_shalat_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/doa_harian/bindings/doa_harian_binding.dart';
import '../modules/doa_harian/views/doa_harian_view.dart';
import '../modules/doa_tahlil/bindings/doa_tahlil_binding.dart';
import '../modules/doa_tahlil/views/doa_tahlil_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/niat_shalat/bindings/niat_shalat_binding.dart';
import '../modules/niat_shalat/views/niat_shalat_view.dart';
import '../modules/surah/bindings/surah_binding.dart';
import '../modules/surah/views/surah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.SURAH,
      page: () => const SurahView(),
      binding: SurahBinding(),
    ),
    GetPage(
      name: _Paths.DOA_HARIAN,
      page: () => const DoaHarianView(),
      binding: DoaHarianBinding(),
    ),
    GetPage(
      name: _Paths.DOA_TAHLIL,
      page: () => const DoaTahlilView(),
      binding: DoaTahlilBinding(),
    ),
    GetPage(
      name: _Paths.AYAT_KURSI,
      page: () => const AyatKursiView(),
      binding: AyatKursiBinding(),
    ),
    GetPage(
      name: _Paths.NIAT_SHALAT,
      page: () => const NiatShalatView(),
      binding: NiatShalatBinding(),
    ),
    GetPage(
      name: _Paths.BACAAN_SHALAT,
      page: () => const BacaanShalatView(),
      binding: BacaanShalatBinding(),
    ),
    GetPage(
      name: _Paths.ASMAUL_HUSNA,
      page: () => const AsmaulHusnaView(),
      binding: AsmaulHusnaBinding(),
    ),
  ];
}
