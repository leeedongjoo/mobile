import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appScreen: AppScreen.users,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '유저 목록',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          TextField(
            decoration: InputDecoration(
                filled: false,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE4E4E7)))),
          )
        ],
      ),
    );
  }
}
