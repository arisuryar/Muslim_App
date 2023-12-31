import 'package:flutter/material.dart';
import 'package:muslim_app/app/constant/app_text.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart'
    as modelDetailAyat;

class AyatTransliteration extends StatelessWidget {
  const AyatTransliteration({
    super.key,
    required this.ayat,
  });

  final modelDetailAyat.Verse ayat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerLeft,
      child: Text(ayat.text.transliteration.en,
          textAlign: TextAlign.justify, style: AppTextStyle.textPurple16Medium),
    );
  }
}
