import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/services/api_service.dart';

class DetailSurahRepository {
  final apiService = Get.find<ApiService>();
  Future<DetailSurah> getDetailSurah(String id) async {
    try {
      final data = await apiService.getDetailSurah(id);
      return DetailSurah.fromJson(data);
    } catch (e) {
      throw Exception('Failed');
    }
  }
}
