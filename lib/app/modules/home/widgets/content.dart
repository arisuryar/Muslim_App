import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijriyah_indonesia/hijriyah_indonesia.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/app/constant/app_color.dart';
import 'package:muslim_app/app/constant/app_text.dart';
import 'package:muslim_app/app/data/models/sholat.dart';
import 'package:muslim_app/app/data/models/user_location.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/app/modules/home/widgets/full_shalat.dart';

class ContainerContent extends StatelessWidget {
  const ContainerContent({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<UserLocation?>(
        future: controller.getCurrentPosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.white,
              ),
            );
          }
          if (snapshot.data == null) {
            return StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(DateFormat('HH:mm').format(DateTime.now()),
                        style: AppTextStyle.textWhite30),
                    AutoSizeText(
                      Hijriyah.now().toFormat('dd MMMM yyyy'),
                      style: AppTextStyle.textWhite16Normal,
                    ),
                  ],
                );
              },
            );
          }
          UserLocation? user = snapshot.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Menampilkan Lokasi User
              user != null
                  ? AutoSizeText(
                      '${user.city}, ${user.country}',
                      style: AppTextStyle.textWhite18Bold,
                    )
                  : const SizedBox(),

              // Menampilkan Jam dan Tanggal Hari Ini
              StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      AutoSizeText(
                        DateFormat('HH:mm').format(DateTime.now()),
                        style: AppTextStyle.textWhite30,
                      ),
                      AutoSizeText(
                        Hijriyah.now().toFormat('dd MMMM yyyy'),
                        style: AppTextStyle.textWhite18Bold,
                      ),
                    ],
                  );
                },
              ),

              // Menampilkan Sholat Hari Ini
              FutureBuilder<Sholat?>(
                future: controller.getSholat(
                    user!.city!.replaceFirst('Kota ', ''),
                    user.country!,
                    DateFormat('dd-MM-yyyy').format(DateTime.now())),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(height: 60);
                  }
                  if (snapshot.hasError) {
                    return const SizedBox();
                  }
                  if (snapshot.data == null) {
                    return const SizedBox();
                  }
                  Sholat? sholat = snapshot.data;
                  return sholat != null
                      ? WidgetFullShalat(sholat: sholat)
                      : const SizedBox();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
