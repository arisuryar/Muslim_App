import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/constant/app_text.dart';

import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/repositories/detail_surah_repository.dart';
import 'package:muslim_app/app/modules/detail_surah/widgets/ayat_arab.dart';
import 'package:muslim_app/app/modules/detail_surah/widgets/ayat_translation_id.dart';
import 'package:muslim_app/app/modules/detail_surah/widgets/ayat_transliteration.dart';
import 'package:muslim_app/app/modules/detail_surah/widgets/leading_ayat.dart';
import 'package:muslim_app/app/modules/detail_surah/widgets/title_content.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  Surah surah = Get.arguments;
  final ayat = Get.put(DetailSurahRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SURAH ${surah.name.transliteration.id.toUpperCase()}',
            style: AppTextStyle.textBlack18Bold),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TitleContent(surah: surah),
          GetBuilder<DetailSurahController>(
            init: DetailSurahController(),
            builder: (detailSurah) {
              return detailSurah.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : detailSurah.errorMessage.isNotEmpty
                      ? Center(
                          child: Text(detailSurah.errorMessage.value),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              detailSurah.detailSurah.value!.verses.length,
                          itemBuilder: (context, index) {
                            final ayat =
                                detailSurah.detailSurah.value!.verses[index];
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  LeadingAyat(
                                      ayat: ayat,
                                      surah: surah,
                                      detailSurah: detailSurah),
                                  const SizedBox(height: 10),
                                  AyatArab(ayat: ayat),
                                  const SizedBox(height: 30),
                                  AyatTransliteration(ayat: ayat),
                                  const SizedBox(height: 20),
                                  AyatTranslationId(ayat: ayat),
                                ],
                              ),
                            );
                          },
                        );
            },
          ),
        ],
      ),
    );
  }
}
