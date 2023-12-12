import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/doa_harian.dart';
import 'package:muslim_app/app/data/services/api_service.dart';

class DoaHarianRepository {
  final apiService = Get.find<ApiService>();
  Future<List<DoaHarian>> getDoaHarian() async {
    try {
      final data = await apiService.getDoaHarian();

      return data.map((e) => DoaHarian.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed');
    }
  }
}
