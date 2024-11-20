import 'dart:convert';
import 'dart:io';
import 'package:app/config.dart';
import 'package:app/helpers/storage_helper.dart';
import 'package:app/models/auth_data.dart';
import 'package:app/models/user_data.dart';
import 'package:app/routes/app_screen.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<http.Response> get(String url) {
    final authData = StorageHelper.authData!;
    http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader:
          '${authData.tokenType} ${authData.token}',
    });
  }

  static Future<http.Response> post(
    String url, {
    Map<String, dynamic>? body,
  }) {
    final authData = StorageHelper.authData!;
  }

  /// NOTE: 로그인 API
  /// - [email] 이메일
  /// - [password] 비밀번호
  /// - [return]
  ///   - AuthData
  static Future<AuthData?> signIn({
    required String email,
    required String password,
  }) async {
    final loginData = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse(Config.api.getToken),
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

  static Future<void> signOut(BuildContext context) async {
    await StorageHelper.removeAuthData();

    if (!context.mounted) return;

    context.goNamed(AppScreen.login.name);
  }

  /// NOTE: 비밀번호 변경 API
  /// - [newPassword]: 새로운 비밀번호
  static Future<(bool success, String error)> changePassword(
      String newPassword) async {
    final authData = StorageHelper.authData!;

    final response = await http.post(
      Uri.parse(Config.api.changePassword),
      headers: {
        HttpHeaders.authorizationHeader:
            '${authData.tokenType} ${authData.token}',
      },
      body: jsonEncode({
        'password': newPassword,
      }),
    );

    final statusCode = response.statusCode;
    final body = utf8.decode(response.bodyBytes);

    if (statusCode != 200) return (false, body);

    return (true, '');
  }

  /// NOTE: 유저 목록 가져오는 API
  static Future<List<UserData>> fetchUserList() async {
    final authData = StorageHelper.authData!;

    final response = await http.get(Config.api.getUserList);

    final statusCode = response.statusCode;
    final body = utf8.decode(response.bodyBytes);

    if (statusCode != 200) return [];

    final bodyJson = jsonDecode(body);
    final List<dynamic> data = bodyJson['data'] ?? [];

    return data.map((e) => UserData.fromMap(e)).toList();
  }

  static Future createChatRoom(String userId) async {
    final result = http.post(Uri.parse(Config.api.createRoom),
        headers: {
          HttpHeaders.authorizationHeader: '',
        },
        body: jsonEncode({
          'user_id': userId,
        }));
  }
}
