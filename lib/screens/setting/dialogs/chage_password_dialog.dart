import 'dart:ui';

import 'package:app/extensions/context_extension.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _currentPwController = TextEditingController();
  final _newPwController = TextEditingController();
  final _newConfirmPwController = TextEditingController();

  final _currentPwFormKey = GlobalKey<FormState>();
  final _newPwFormKey = GlobalKey<FormState>();
  final _newConfirmPwFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _currentPwController.dispose();
    _newPwController.dispose();
    _newConfirmPwController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required Key formKey,
    required TextEditingController textEditingController,
    required String hintText,
    bool obscureText = true,
    String? Function(String? valure)? validator,
  }) {
    return ListTile(
        title: Form(
      key: _currentPwFormKey,
      child: TextFormField(
        controller: _currentPwController,
        decoration: const InputDecoration(
          hintText: '현재 비밀번호',
          filled: false,
          suffixIcon: Icon(Icons.visibility),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    const dialog = Dialog(
      child: Padding(
          padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '비밀번호 변경',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          20.heightBox,
          Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: context.theme.dividerColor,
                  )),
              child: Column(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    _buildTextField(
                        formKey: _currentPwFormKey,
                        textController: _currentPwController,
                        hintText: '현재 비밀번호',
                        obscureText: _obscureCurrent,
                        onObscurePressed: () {
                          setState(() {
                            _obscureCurrent = !_obscureCurrent;
                          });
                        }),
                    ListTile(),
                    ListTile(),
                    ListTile(),
                  ],
                ),
              )),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4E46Dc),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: null,
          )
        ],
      ),
    );
    return dialog;
  }
}
