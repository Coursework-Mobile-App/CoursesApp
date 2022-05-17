import 'package:courses_app/bloc_architecture/bloc_auth/auth_events.dart';
import 'package:courses_app/bloc_architecture/bloc_code/auth_events.dart';
import 'package:courses_app/bloc_architecture/bloc_code/code_bloc.dart';
import 'package:courses_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../bloc_architecture/bloc_auth/auth_bloc.dart';
import '../bloc_architecture/bloc_home/home_bloc.dart';

class CodeScreen extends StatefulWidget {
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  TextEditingController codeController = new TextEditingController();
  bool _validatecode = false;

  @override
  Widget build(BuildContext context) {
    final CodeBloc bloc = BlocProvider.of<CodeBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Center(
            child: Container(
                height: 140,
                width: 400,
                child: Icon(
                  Icons.lock_clock_outlined,
                  size: 140,
                  color: Color(0xFFEC407A),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Код выслан вам на почту',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: TextField(
              controller: codeController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Почта',
                errorText: _validatecode ? 'Неверная почта' : null,
                focusedErrorBorder: _validatecode
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEC407A)),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                    : null,
                errorBorder: _validatecode
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                    : null,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              //keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
            child: GestureDetector(
              onTap: () {
                if (codeController.text.isEmpty) {
                  setState(() {
                    _validatecode = true;
                  });
                } else {
                  print('object');
                  bloc.inEvent.add(OnSendCodeClick());
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 70,
                  color: Color(0xFFEC407A),
                  child: Center(
                    child: Text('О Т П Р А В И Т Ь',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
