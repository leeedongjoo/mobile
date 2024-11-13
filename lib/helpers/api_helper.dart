import 'dart:convert';
import 'dart:io';
import 'package:app/config.dart';
import 'package:app/helpers/storage_helper.dart';
import 'package:app/models/auth_data.dart';
import 'package:app/models/user_data.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  // - {email}이메일
  // - {password} 비밀번호
  //// - {return}
  static Future<AuthData?> signIn({
    required String email,
    required String password,
  }) async {
    final loginData = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse(getTokenUrl),
      body: jsonEncode(loginData),
    );

    final statusCode = response.statusCode;
    final body = utf8.decode(response.bodyBytes);

    if (statusCode != 200) return null;

    final bodyJson = jsonDecode(body) as Map<String, dynamic>;

    bodyJson.addAll({'email': email});

    try {
      return AuthData.fromMap(bodyJson);
    } catch (e, stack) {
      Log.red('유저 정보 파싱 에러: $e\n$stack');
      return null;
    }
  }

  static Future<(bool sucess, String error)> changePassword(
    String newPassword,
  ) async {
    final authData = StorageHelper.authData;
    final response = http.post(
      Uri.parse(Config.api.changePassword),
      headers: {
        HttpHeaders.authorizationHeader: '',
      },
    );
  }

  static Future fetchUserList() async {
    final AuthData = StorageHelper.authData!;

    final response = await http.get(
      Uri.parse(Config.api.getUserList),
      headers: {
        HttpHeaders.authorizationHeader:
            '${authData.tokenType} ${authData.token}',
      },
    );
    final statusCode = response.statusCode;
    final body = utf8.decode(response.bodyBytes);
    if (statusCode != 200) return [];

    final bodyJson = jsonDecode(body);
    final List<dynamic> data = bodyJson['data'] ?? [];

    return data.map((e) => UserData.fromMap(e)).toList();
  }
}
