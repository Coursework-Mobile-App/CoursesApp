import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
                height: 140,
                width: 400,
                child: Icon(
                  Icons.done_all_outlined,
                  size: 140,
                  color: Color(0xFFEC407A),
                )),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Введите код подтверждения',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 60,
                color: Colors.pink[50],
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Color(0xFFEC407A),
                      ),
                    ),
                    Text(
                      'Код',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
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
        ],
      ),
    );
  }
}