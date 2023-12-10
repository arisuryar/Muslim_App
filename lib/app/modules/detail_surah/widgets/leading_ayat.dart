import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/constant/app_color.dart';
import 'package:muslim_app/app/constant/app_text.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart'
    as modelDetailAyat;

import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/modules/detail_surah/controllers/detail_surah_controller.dart';

class LeadingAyat extends StatelessWidget {
  const LeadingAyat({
    super.key,
    required this.ayat,
    required this.surah,
    required this.detailSurah,
  });

  final modelDetailAyat.Verse ayat;
  final DetailSurahController detailSurah;
  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.purpleLight.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  image: AssetImage('assets/icons/list.png'),
                ),
              ),
              child: Center(
                child: Text(
                  ayat.number.inSurah.toString(),
                  style: AppTextStyle.textBlack12SemiBold,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      titlePadding: const EdgeInsets.only(top: 20, bottom: 5),
                      title: 'Tafsir Ayat ${ayat.number.inSurah}'.toUpperCase(),
                      titleStyle: AppTextStyle.textBlack18Bold,
                      content: SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Text(
                              ayat.tafsir.id.short,
                              textAlign: TextAlign.justify,
                              style: AppTextStyle.textBlack12SemiBold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                  color: AppColor.purpleLight,
                ),
                (ayat.kondisiAudio == 'stop')
                    ? IconButton(
                        onPressed: () {
                          detailSurah.playAudio(ayat);
                        },
                        icon: const Icon(Icons.play_arrow_rounded),
                        color: AppColor.purpleLight,
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (ayat.kondisiAudio == 'playing')
                              ? IconButton(
                                  onPressed: () {
                                    detailSurah.pauseAudio(ayat);
                                  },
                                  icon: const Icon(
                                    Icons.pause,
                                    color: AppColor.purpleLight,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    detailSurah.resumeAudio(ayat);
                                  },
                                  icon: const Icon(
                                    Icons.play_arrow_rounded,
                                    color: AppColor.purpleLight,
                                  ),
                                ),
                          IconButton(
                            onPressed: () {
                              detailSurah.stopAudio(ayat);
                            },
                            icon: const Icon(
                              Icons.stop,
                              color: AppColor.purpleLight,
                            ),
                          ),
                        ],
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
