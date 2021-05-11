import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:flutter/material.dart';

import 'user_bloc.dart';
import 'user_module.dart';

class UserPage extends StatefulWidget {
  final String title;

  const UserPage({Key key, this.title = "Joao"}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserPageBloc _userBloc = UserModule.to.getBloc<UserPageBloc>();

  @override
  void initState() {
    super.initState();
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
            Text("Teste")
          ],
        ),
      ),
    );
  }


}
