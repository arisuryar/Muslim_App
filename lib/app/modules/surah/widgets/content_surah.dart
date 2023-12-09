import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/routes/app_pages.dart';

class ContentSurah extends StatelessWidget {
  const ContentSurah({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      title: Text(
        surah.name.transliteration.id,
        style: TextStyle(
            color: const Color(0XFF240F4F),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 16.sp),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            surah.revelation.id.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              fontSize: 10.sp,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.circle, size: 5, color: Color(0XFFBBC4CE)),
          const SizedBox(width: 5),
          Text(
            '${surah.numberOfVerses} AYAT',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              fontSize: 10.sp,
            ),
          )
        ],
      ),
      trailing: Text(
        surah.name.short,
        style: TextStyle(
            fontFamily: 'Lateef',
            color: const Color(0XFF863ED5),
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
