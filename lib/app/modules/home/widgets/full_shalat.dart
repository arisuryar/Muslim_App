import 'package:flutter/material.dart';
import 'package:muslim_app/app/data/models/sholat.dart';
import 'package:muslim_app/app/modules/home/widgets/sholat.dart';

class WidgetFullShalat extends StatelessWidget {
  const WidgetFullShalat({
    super.key,
    required this.sholat,
  });

  final Sholat sholat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WidgetSholat(
            sholat: 'Imsak',
            time: sholat.timings.imsak,
          ),
          WidgetSholat(
            sholat: 'Subuh',
            time: sholat.timings.fajr,
          ),
          WidgetSholat(
            sholat: 'Zuhur',
            time: sholat.timings.dhuhr,
          ),
          WidgetSholat(
            sholat: 'Asar',
            time: sholat.timings.asr,
          ),
          WidgetSholat(
            sholat: 'Maghrib',
            time: sholat.timings.maghrib,
          ),
          WidgetSholat(
            sholat: 'Isya',
            time: sholat.timings.isha,
          ),
        ],
      ),
    );
  }
}
