import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/repositories/detail_surah_repository.dart';

class DetailSurahController extends GetxController {
  Surah surah = Get.arguments;
  final DetailSurahRepository detailSurahRepository =
      Get.put(DetailSurahRepository());

  final _detailSurah = Rx<DetailSurah?>(null);
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;

  Rx<DetailSurah?> get detailSurah => _detailSurah;
  RxBool get isLoading => _isLoading;
  RxString get errorMessage => _errorMessage;

  @override
  void onInit() {
    super.onInit();
    fetchDetailSurah(surah.number.toString());
  }

  Future<void> fetchDetailSurah(String id) async {
    _isLoading.value = true;
    _errorMessage.value = '';

    try {
      DetailSurah? detail = await detailSurahRepository.getDetailSurah(id);

      _detailSurah.value = detail;
    } catch (e) {
      _errorMessage.value = 'Failed to fetch surah';
    } finally {
      _isLoading.value = false;
      update();
    }
  }
}
