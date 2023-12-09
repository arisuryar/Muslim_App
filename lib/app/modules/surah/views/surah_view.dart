import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/modules/surah/widgets/content_surah.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  const SurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SurahController>(
        init: SurahController(),
        builder: (surahModel) {
          return surahModel.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : surahModel.errorMessage.isNotEmpty
                  ? Center(
                      child: Text(surahModel.errorMessage.value),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: surahModel.surah.length,
                      itemBuilder: (context, index) {
                        final surah = surahModel.surah[index];
                        return ContentSurah(surah: surah);
                      },
                    );
        },
        // ),
      ),
    );
  }
}
