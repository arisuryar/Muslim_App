import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/doa_harian.dart';
import 'package:muslim_app/app/data/repositories/doa_harian_repository.dart';

class DoaHarianController extends GetxController {
  final DoaHarianRepository doaHarianRepository =
      Get.put(DoaHarianRepository());

  final _doaHarian = <DoaHarian>[].obs;
  var _isLoading = false.obs;
  var _errorMessage = ''.obs;

  List<DoaHarian> get doaHarian => _doaHarian;
  RxBool get isLoading => _isLoading;
  RxString get errorMessage => _errorMessage;

  @override
  void onInit() {
    super.onInit();
    fetchDoaHarian();
  }

  Future<void> fetchDoaHarian() async {
    _isLoading = true.obs;
    _errorMessage = ''.obs;

    try {
      _doaHarian.value = await doaHarianRepository.getDoaHarian();
    } catch (e) {
      _errorMessage = 'Failed fetch Doa Harian'.obs;
    } finally {
      _isLoading = false.obs;
      update();
    }
  }
}
