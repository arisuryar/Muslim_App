import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:muslim_app/app/data/repositories/surah_repository.dart';

import 'package:muslim_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final surah = Get.put(SurahRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
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
                      itemCount: surahModel.surah.length,
                      itemBuilder: (context, index) {
                        final surah = surahModel.surah[index];
                        return ListTile(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
                          },
                          title: Text(surah.name.transliteration.id),
                          subtitle: Text(surah.revelation.id),
                          leading: CircleAvatar(
                            child: Text(surah.number.toString()),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
