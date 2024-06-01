import 'package:shared_preferences/shared_preferences.dart';

import '../error/exception.dart';

class AppSession {
  final SharedPreferences _preferences;

  AppSession(this._preferences);

  // Key untuk menyimpan data Last Read
  final String key = 'last-read';

  // Mendapatkan data Terakhir dibaca
  String? getLastRead() {
    return _preferences.getString(key);
  }

  // Menyimpan data Terakhir dibaca
  Future<String> saveLastRead(String data) async {
    try {
      String message;

      // Mengecek apakah data sebelumnya ada
      if (_preferences.getString(key) == null) {
        message = 'Berhasil menambahkan terakhir dibaca';
      } else {
        message = 'Terakhir dibaca berhasil diperbarui';
      }

      // Meyimpan data ke session
      bool isSuccess = await _preferences.setString(key, data);

      // Jika gagal, throw CacheException()
      if (!isSuccess) throw CacheException();

      // Mengembalikan pesan success
      return message;
    } catch (_) {
      throw CacheException();
    }
  }
}
