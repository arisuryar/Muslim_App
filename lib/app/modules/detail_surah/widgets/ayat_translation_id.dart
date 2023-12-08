import 'package:flutter/material.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart'
    as modelDetailAyat;

class AyatTranslationId extends StatelessWidget {
  const AyatTranslationId({
    super.key,
    required this.ayat,
  });

  final modelDetailAyat.Verse ayat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        ayat.translation.id,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            color: Color(0XFF8789A3),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
