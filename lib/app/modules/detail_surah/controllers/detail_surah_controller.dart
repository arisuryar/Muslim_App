import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/detail_surah.dart';
import 'package:muslim_app/app/data/models/surah.dart';
import 'package:muslim_app/app/data/repositories/detail_surah_repository.dart';
import 'package:just_audio/just_audio.dart';

class DetailSurahController extends GetxController {
  Surah surah = Get.arguments;
  final DetailSurahRepository detailSurahRepository =
      Get.put(DetailSurahRepository());

  final player = AudioPlayer();
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

  void playAudio(Verse ayat) async {
    if (ayat.audio.primary != null) {
      try {
        await player.stop();
        await player.setUrl(ayat.audio.primary);
        ayat.kondisiAudio = 'playing';
        update();

        await player.play();
        ayat.kondisiAudio = 'stop';
        update();
      } on PlayerException catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan', middleText: e.message.toString());
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan', middleText: e.message.toString());
      } catch (e) {
        Get.defaultDialog(title: 'Terjadi Kesalahan', middleText: e.toString());
      }
    } else {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Tidak dapat memutar audio, harap ulangi.');
    }
  }

  void pauseAudio(Verse ayat) async {
    try {
      await player.pause();
      ayat.kondisiAudio = 'pause';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: e.message.toString());
    } catch (e) {
      Get.defaultDialog(title: 'Terjadi Kesalahan', middleText: e.toString());
    }
  }

  void resumeAudio(Verse ayat) async {
    try {
      ayat.kondisiAudio = 'playing';
      update();
      await player.play();
      ayat.kondisiAudio = 'stop';
      await player.stop();
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: e.message.toString());
    } catch (e) {
      Get.defaultDialog(title: 'Terjadi Kesalahan', middleText: e.toString());
    }
  }

  void stopAudio(Verse ayat) async {
    try {
      await player.stop();
      ayat.kondisiAudio = 'stop';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan', middleText: e.message.toString());
    } catch (e) {
      Get.defaultDialog(title: 'Terjadi Kesalahan', middleText: e.toString());
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    player.dispose();
    player.stop();
    super.onClose();
  }
}
