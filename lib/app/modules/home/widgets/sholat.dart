import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetSholat extends StatelessWidget {
  const WidgetSholat({
    super.key,
    required this.sholat,
    required this.time,
  });

  final String sholat;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          sholat,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto'),
        ),
        AutoSizeText(
          time,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto'),
        ),
      ],
    );
  }
}
