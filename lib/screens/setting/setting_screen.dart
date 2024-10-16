import 'dart:convert';
import 'dart:io';

import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:app/config.dart';
import 'package:app/helpers/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../routes/app_screen.dart';
import 'package:easy_extension/easy_extension.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  // NOTE: 유저 정보 가져오기
  Future<Map<String, dynamic>> fetchUserData() async {
    final tokenType = StorageHelper.authData!.tokenType.firstUpperCase;
    final token = StorageHelper.authData!.token;

    final response = await http.get(
      Uri.parse(getUserDataUrl),
      headers: {
        HttpHeaders.authorizationHeader: '$tokenType $token',
      },
    );

    final statusCode = response.statusCode;
    final body = utf8.decode(response.bodyBytes);

    if (statusCode != 200) throw Exception(body);

    return jsonDecode(body);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appScreen: AppScreen.setting,
      child: Column(
        children: [
          FutureBuilder(
              future: fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    child: const CircularProgressIndicator(),
                  );
                }

                final error = snapshot.error;
                final userData = snapshot.data;

                String name = '데이터를 불러올 수 없습니다.';
                String studentNumber = '';
                String profileImage = '';

                if (error != null) studentNumber = '$error';

                if (userData != null) {
                  name = userData['name'];
                  studentNumber = userData['student_number'];
                  profileImage = userData['profile_image'];
                }

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                  ),
                  title: Text(name),
                  subtitle: Text(studentNumber),
                );
              }),
        ],
      ),
    );
  }
}
