import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/error/exception.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class MuslimRemoteDataSource {
  Future<List<BacaanSholatModel>> fetchAllBacaanSholat();
  Future<List<DoaModel>> fetchAllDoa();
  Future<List<HaditsModel>> fetchAllHadits();
  Future<List<NiatSholatModel>> fetchAllNiatSholat();
  Future<List<SurahModel>> fetchAllSurah();
  Future<SurahModel> fetchDetailSurah({required int id});
  Future<SholatModel> fetchSholat({required LocationEntity location});
}

class MuslimRemoteDataSourceImpl implements MuslimRemoteDataSource {
  final http.Client _client;

  MuslimRemoteDataSourceImpl(this._client);

  @override
  Future<List<BacaanSholatModel>> fetchAllBacaanSholat() async {
    final res = await _client.get(
      Uri.parse('https://islamic-api-zhirrr.vercel.app/api/bacaanshalat'),
    );

    if (res.statusCode == 200) {
      List listJson = jsonDecode(res.body);

      return listJson.map((data) => BacaanSholatModel.fromJson(data)).toList();
    } else if (res.statusCode == 404) {
      throw NotFoundException();
    } else if (res.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<DoaModel>> fetchAllDoa() async {
    final res = await _client.get(
      Uri.parse('https://api.myquran.com/v2/doa/all'),
    );

    if (res.statusCode == 200) {
      List listJson = jsonDecode(res.body)['data'];

      return listJson.map((data) => DoaModel.fromJson(data)).toList();
    } else if (res.statusCode == 404) {
      throw NotFoundException();
    } else if (res.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<HaditsModel>> fetchAllHadits() async {
    final res = await _client.get(
      Uri.parse('https://api.myquran.com/v2/hadits/arbain/semua'),
    );

    if (res.statusCode == 200) {
      List listJson = jsonDecode(res.body)['data'];

      return listJson.map((data) => HaditsModel.fromJson(data)).toList();
    } else if (res.statusCode == 404) {
      throw NotFoundException();
    } else if (res.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<NiatSholatModel>> fetchAllNiatSholat() async {
    final res = await _client.get(
      Uri.parse('https://islamic-api-zhirrr.vercel.app/api/niatshalat'),
    );

    if (res.statusCode == 200) {
      List listJson = jsonDecode(res.body);

      return listJson.map((data) => NiatSholatModel.fromJson(data)).toList();
    } else if (res.statusCode == 404) {
      throw NotFoundException();
    } else if (res.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<List<SurahModel>> fetchAllSurah() async {
    final res = await _client.get(
      Uri.parse('https://api.quran.gading.dev/surah'),
    );

    if (res.statusCode == 200) {
      List listJson = jsonDecode(res.body)['data'];

      return listJson.map((data) => SurahModel.fromJson(data)).toList();
    } else if (res.statusCode == 404) {
      throw NotFoundException();
    } else if (res.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<SurahModel> fetchDetailSurah({required int id}) async {
    final res = await _client.get(
      Uri.parse('https://api.quran.gading.dev/surah/$id'),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> mapJson = jsonDecode(res.body)['data'];

      return SurahModel.fromJson(mapJson);
    } else if (res.statusCode == 404) {
      throw NotFoundException();
    } else if (res.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }

  @override
  Future<SholatModel> fetchSholat({required LocationEntity location}) async {
    final res = await _client.get(
      Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity?city=${location.city}&country=${location.country}&method=20',
      ),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> mapJson = jsonDecode(res.body)['data'];

      return SholatModel.fromJson(mapJson);
    } else if (res.statusCode == 404) {
      throw NotFoundException();
    } else if (res.statusCode == 500) {
      throw ServerException();
    } else {
      throw GeneralException();
    }
  }
}
