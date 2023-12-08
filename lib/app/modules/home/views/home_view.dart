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
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                image: AssetImage('assets/icons/list.png'),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                surah.number.toString(),
                                style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          title: Text(
                            surah.name.transliteration.id,
                            style: const TextStyle(
                                color: Color(0XFF240F4F),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                fontSize: 18),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                surah.revelation.id.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto',
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.circle,
                                  size: 5, color: Color(0XFFBBC4CE)),
                              const SizedBox(width: 5),
                              Text(
                                '${surah.numberOfVerses} AYAT',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto',
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                          trailing: Text(
                            surah.name.short,
                            style: const TextStyle(
                                fontFamily: 'Lateef',
                                color: Color(0XFF863ED5),
                                fontSize: 32,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
