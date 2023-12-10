import 'package:flutter/material.dart';
import 'package:muslim_app/app/constant/app_color.dart';

class TabBarList extends StatelessWidget {
  const TabBarList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 20),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 2.5,
      indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
      overlayColor: const MaterialStatePropertyAll(AppColor.white),
      labelColor: AppColor.purpleLight,
      unselectedLabelColor: AppColor.grey,
      labelStyle:
          const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      indicator: BoxDecoration(
        color: AppColor.purpleLight.withOpacity(0.15),
        border: Border.all(color: AppColor.purpleLight, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      tabs: const <Widget>[
        Tab(
          text: "Al-Qur'an",
        ),
        Tab(
          text: "Doa'a Harian",
        ),
        Tab(
          text: "Do'a Tahlil",
        ),
        Tab(
          text: "Ayat Kursi",
        ),
        Tab(
          text: "Niat Shalat",
        ),
        Tab(
          text: "Bacaan Shalat",
        ),
        Tab(
          text: "Asmaul Husna",
        ),
      ],
    );
  }
}
