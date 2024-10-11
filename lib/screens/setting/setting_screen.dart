import 'dart:convert';

import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:app/config.dart';
import 'package:app/helpers/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../routes/app_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<Map<String, dynamic>> fetchUserData() async {
    final token = StorageHelper.authData!.token;

    final response = await http.post(
      Uri.parse(getUseDataUrl),
    );

    final statusCode = response.statusCode;
    final body = utf8.decode(response.bodyBytes);

    if (statusCode != 200) throw Exception('Failed Fetch');
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          ('https://daelim-server.fleecy.dev/storage/v1/object/public/icons/user.png')),
                    ),
                    title: Text('대림대'),
                    subtitle: Text('201930420'),
                  );
                })
          ],
        ));
  }
}
