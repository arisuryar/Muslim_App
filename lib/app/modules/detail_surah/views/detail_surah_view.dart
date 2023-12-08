import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/repositories/detail_surah_repository.dart';
import 'package:muslim_app/app/data/services/api_service.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  Surah surah = Get.arguments;
  final ayat = Get.put(DetailSurahRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.name.transliteration.id),
        centerTitle: true,
      ),
      body: GetBuilder<DetailSurahController>(
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
                      itemCount: detailSurah.detailSurah.value!.verses.length,
                      itemBuilder: (context, index) {
                        final ayat =
                            detailSurah.detailSurah.value!.verses[index];
                        return ListTile(
                          title: Text(ayat.text.arab),
                        );
                      },
                    );
        },
      ),
    );
  }
}
