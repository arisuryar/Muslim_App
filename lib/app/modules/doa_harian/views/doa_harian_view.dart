import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/constant/app_color.dart';
import 'package:muslim_app/app/constant/app_text.dart';

import '../controllers/doa_harian_controller.dart';

class DoaHarianView extends GetView<DoaHarianController> {
  const DoaHarianView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: GetBuilder<DoaHarianController>(
        init: DoaHarianController(),
        builder: (doaHarian) {
          return doaHarian.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : doaHarian.errorMessage.isNotEmpty
                  ? Center(
                      child: Text(doaHarian.errorMessage.value),
                    )
                  : ListView.builder(
                      itemCount: doaHarian.doaHarian.length,
                      itemBuilder: (context, index) {
                        final doaH = doaHarian.doaHarian[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          color: AppColor.blackPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                width: 1, color: AppColor.purpleLight),
                          ),
                          child: ExpansionTile(
                            backgroundColor: AppColor.white,
                            collapsedBackgroundColor: AppColor.white,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide.none),
                            collapsedShape: const RoundedRectangleBorder(
                                side: BorderSide.none),
                            title: Text(
                              doaH.title,
                              style: AppTextStyle.textBlack18Bold,
                            ),
                            childrenPadding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 8),
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  doaH.arabic,
                                  textAlign: TextAlign.end,
                                  style: AppTextStyle.arabicBlack40Medium,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  doaH.latin,
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyle.textPurple14Normal,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  doaH.translation,
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyle.textGrey14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
