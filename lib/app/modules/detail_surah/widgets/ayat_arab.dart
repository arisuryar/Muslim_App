import 'package:flutter/material.dart';
import 'package:muslim_app/app/constant/app_text.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart'
    as modelDetailAyat;

class AyatArab extends StatelessWidget {
  const AyatArab({
    super.key,
    required this.ayat,
  });

  final modelDetailAyat.Verse ayat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerRight,
      child: Text(ayat.text.arab,
          textAlign: TextAlign.end, style: AppTextStyle.arabicBlack40Medium),
    );
  }
}
