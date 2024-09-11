import 'package:app/config.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onFetchedApi() async{
    http.post(Uri.parse(authUrl),
    final loginData ={
      'email':'',
      'password':'',
    }
    );

    Log.green({
      'status': response.statusCode,
      'body':,
      
    })
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: ElevatedButton(
          onPressed: _onFetchedApi,
          child: const Text('API 호출'),
        ),
      ),
    ));
  }
}
