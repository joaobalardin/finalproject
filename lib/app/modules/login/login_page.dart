import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:flutter/material.dart';

import 'login_bloc.dart';
import 'login_module.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Joao"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc = LoginModule.to.getBloc<LoginBloc>();

  String username;

  @override
  void initState() {
    super.initState();
    username = "joao";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbox"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextInputWidget(
              "Username",
              callback: (String name) => {username = name},
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            SubmitWidget(
              () => _loginBloc.login(context, username),
              text: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
