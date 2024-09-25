import 'dart:convert';
import 'dart:ui';

import 'package:app/common/widgets/gradient_divider.dart';
import 'package:app/config.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _pwController = TextEditingController();


  void _onFetchedApi() async{
    http.post(Uri.parse(authUrl),);
    final loginData ={
      'email':'',
      'password':'',
    };
    
    final response = await http.post(
      Uri.parse(authUrl),
      body:  jsonEncode(loginData),
    );

    Log.green({
      'status': response.statusCode,
      'body':response.body,
      
    });
  }
  List<Widget> _buildTitleText(){
    return [
      Text('Hello Again',
          style: GoogleFonts.poppins(
            fontSize:28,
            fontweight: FontWeight.bold,
          ),
          ),
          15.heightBox,
          Text(
            'Wellcome back you'
          )];
  }
  Widget _buildTextField({
    required TextEditingController controller,
    required hintText,
    bool obscure = false,}) {
    return TextField(
      controller:controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
       focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
       ),
        hintText: hintText,
        prefixIcon:obscure != null
        ? Icon(
          obscure
          ?Icons.visibility_off
          :Icons.visibility
          )
        ),
        obscureText: obscure ?? false,
    );
    
  }
  // bool nolamda(){
  //   return false;
  // }
  // bool lamda() => true;
  // bool get getLamda => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              child: DefaultTextStyle(style: GoogleFonts.poppins(
                color: Theme.of(context).textTheme.bo
              ))
              horizontal: 16,
            ),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          double.infinity.widthBox,
          40.heightBox,
          ..._buildTitleText(
            controller: _emailController,
            hintText:'Enter email',

          ),
          20.heightBox,
          ..._buildTitleText(
            onObscure:(down){
              setState((){
                _isObscure = !down;
              })
            }
            controller: _pwController,
            hintText:'Enter password',
            obscure: _isObscure,

          ),
          TextButton(
            onPressed: :_onRecoveryPassword,
            child: Text(
              'Recovery Password',
              style: GoogleFonts.poppins(
                fontSize: 12,
                )
              ),
          ),
          SizedBox(
            width:  double.infinity,
            child:ElevatedButton(
            onPressed: _onSignIn,
            style: ElevatedButton.styleFrom(

              backgroundColor: Color(0xFFE46A61),
              padding: const EdgeInsets.symmetric(
             
                vertical: 20,
              ),
              shape: RoundedRectangleBorder()
            ),
            child: Text(
              'Sign In',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ),
          ),
          40.heightBox,
          Row(
            children: [
              const GradientDivider(),
              15.widthBox,
              const Text(
                'Or continue with',
              ),
              15.widthBox,
            const GradientDivider(
              reverse: true,
            ),
            ],
          )
        ],
        ),)
      
      ),
    );
    
  }
}
