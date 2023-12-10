import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/constant/app_text.dart';

import 'package:muslim_app/app/data/repositories/surah_repository.dart';
import 'package:muslim_app/app/modules/asmaul_husna/views/asmaul_husna_view.dart';
import 'package:muslim_app/app/modules/ayat_kursi/views/ayat_kursi_view.dart';
import 'package:muslim_app/app/modules/bacaan_shalat/views/bacaan_shalat_view.dart';
import 'package:muslim_app/app/modules/doa_harian/views/doa_harian_view.dart';
import 'package:muslim_app/app/modules/doa_tahlil/views/doa_tahlil_view.dart';
import 'package:muslim_app/app/modules/home/widgets/content.dart';
import 'package:muslim_app/app/modules/home/widgets/tab_bar_list.dart';
import 'package:muslim_app/app/modules/niat_shalat/views/niat_shalat_view.dart';
import 'package:muslim_app/app/modules/surah/views/surah_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final surah = Get.put(SurahRepository());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Get.width, Get.width * 0.76),
          child: SafeArea(
            child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Column(
                children: [
                  const SizedBox(height: 9),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Muslim App',
                      style: AppTextStyle.textPurple30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: Get.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/masjid.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                          child: ContainerContent(controller: controller),
                        ),
                      ),
                    ),
                  ),
                  const TabBarList(),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SurahView(),
            DoaHarianView(),
            DoaTahlilView(),
            AyatKursiView(),
            NiatShalatView(),
            BacaanShalatView(),
            AsmaulHusnaView(),
          ],
        ),
      ),
    );
  }
}
