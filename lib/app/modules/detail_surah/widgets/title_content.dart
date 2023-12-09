import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
          titleStyle: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold),
          content: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Text(
                  surah.tafsir.id,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Roboto',
                  ),
                ),
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
              const Color(0XFF994EF8).withOpacity(0.1),
              const Color(0XFF863ED5).withOpacity(0.1),
              const Color(0XFF763FBC).withOpacity(0.1),
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
                  Text(
                    surah.name.transliteration.id.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.info_outline_rounded,
                    color: Color(0XFF9543FF),
                  ),
                ],
              ),
              Text(
                surah.name.short,
                style: TextStyle(
                    fontFamily: 'Lateef',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF9543FF)),
              ),
              Text(
                surah.name.translation.id,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    surah.revelation.id.toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.circle,
                    color: Colors.grey,
                    size: 6,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${surah.numberOfVerses} AYAT',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
