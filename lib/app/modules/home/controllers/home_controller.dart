import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/repositories/surah_repository.dart';

class HomeController extends GetxController {
  final SurahRepository surahRepository = Get.put(SurahRepository());

  final _surah = <Surah>[].obs;
  var _isLoading = false.obs;
  var _errorMessage = ''.obs;

  List<Surah> get surah => _surah;
  RxBool get isLoading => _isLoading;
  RxString get errorMessage => _errorMessage;

  @override
  void onInit() {
    super.onInit();
    fetchAllSurah();
  }

  Future<void> fetchAllSurah() async {
    _isLoading = true.obs;
    _errorMessage = ''.obs;

    try {
      _surah.value = await surahRepository.getAllSurah();
    } catch (e) {
      _errorMessage = 'Failed to fetch surah'.obs;
    } finally {
      _isLoading = false.obs;
      update();
    }
  }

  void playAudio(Verse ayat) {}
}
