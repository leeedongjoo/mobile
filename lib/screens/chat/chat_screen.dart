import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:app/routes/app_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _primaryColor = const Color(0xFF4E80EE);
  final _secondaryColor = Colors.white;
  final _backgroundColor = const Color(0xFF00000);
  void _onSendMessage() {}
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar,
      appScreen: AppScreen.chattingRooms,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '메시지를 입력하세요',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
