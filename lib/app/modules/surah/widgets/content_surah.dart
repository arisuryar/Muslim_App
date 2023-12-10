import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/constant/app_text.dart';
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
          child: AutoSizeText(
            surah.number.toString(),
            maxLines: 1,
            style: AppTextStyle.textBlack14SemiBold,
          ),
        ),
      ),
      title: AutoSizeText(
        surah.name.transliteration.id,
        maxLines: 1,
        style: AppTextStyle.textBlack18Bold,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(surah.revelation.id.toUpperCase(),
              style: AppTextStyle.textGrey12),
          const SizedBox(width: 5),
          const Icon(Icons.circle, size: 5, color: Color(0XFFBBC4CE)),
          const SizedBox(width: 5),
          Text('${surah.numberOfVerses} AYAT', style: AppTextStyle.textGrey12)
        ],
      ),
      trailing: Text(
        surah.name.short,
        style: AppTextStyle.arabicPurple30,
      ),
    );
  }
}
