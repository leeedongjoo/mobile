import 'package:app/models/auth_data.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences? _pref;

  static const String _authKey = 'authKey';

  /// SharedPreference 초기화
  static Future<void> initialized() async {
    _pref = await SharedPreferences.getInstance();
  }

  /// AuthData 저장하기
  static Future<bool> setAuthData(AuthData data) {
    return _pref!.setString(_authKey, data.toJson());
  }

  /// AuthData 불러오기
  static AuthData? get authData {
    final data = _pref!.getString(_authKey);
    return data != null ? AuthData.fromJson(data) : null;
  }
}
