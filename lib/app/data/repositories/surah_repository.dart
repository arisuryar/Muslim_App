import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/services/api_service.dart';

class SurahRepository {
  final ApiService apiService = Get.put(ApiService());
  Future<List<Surah>> getAllSurah() async {
    try {
      final data = await apiService.getAllSurah();

      return data.map((e) => Surah.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed');
    }
  }
}
