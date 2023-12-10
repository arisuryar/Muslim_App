import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/constant/app_color.dart';
import 'package:muslim_app/app/constant/app_text.dart';
import 'package:muslim_app/app/data/models/surah.dart';

class TitleContent extends StatelessWidget {
  const TitleContent({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          backgroundColor: Colors.white,
          titlePadding: const EdgeInsets.only(top: 20, bottom: 5),
          title: 'Tafsir Surah ${surah.name.transliteration.id}'.toUpperCase(),
          titleStyle: AppTextStyle.textBlack18Bold,
          content: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Text(surah.tafsir.id,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.textBlack12SemiBold),
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.purpleLight.withOpacity(0.1),
              AppColor.purpleMid.withOpacity(0.1),
              AppColor.purpleDark.withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  Text(surah.name.transliteration.id.toUpperCase(),
                      style: AppTextStyle.textBlack18Bold),
                  const Icon(
                    Icons.info_outline_rounded,
                    color: AppColor.purpleLight,
                  ),
                ],
              ),
              Text(surah.name.short, style: AppTextStyle.arabicPurple24),
              Text(surah.name.translation.id,
                  style: AppTextStyle.textBlack14SemiBold),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    surah.revelation.id.toUpperCase(),
                    style: AppTextStyle.textGrey12,
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.circle,
                    color: AppColor.grey,
                    size: 6,
                  ),
                  const SizedBox(width: 5),
                  Text('${surah.numberOfVerses} AYAT',
                      style: AppTextStyle.textGrey12),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
