import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  // Get All Surah to API Endpoint
  Future<List<dynamic>> getAllSurah() async {
    try {
      final response =
          await http.get(Uri.parse('https://alquran-apiii.vercel.app/surah'));
      if (response.statusCode == 200) {
        List data =
            (json.decode(response.body) as Map<String, dynamic>)['data'];
        return data;
      } else {
        throw Exception('Error : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }

  // Get Detail Surah to API Endpoint.
  Future<Map<String, dynamic>> getDetailSurah(String id) async {
    try {
      final response = await http
          .get(Uri.parse('https://alquran-apiii.vercel.app/surah/$id'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            (json.decode(response.body) as Map<String, dynamic>)['data'];
        return data;
      } else {
        throw Exception('Error : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}
