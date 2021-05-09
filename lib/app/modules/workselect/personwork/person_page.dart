import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:flutter/material.dart';

import 'person_bloc.dart';
import 'person_module.dart';

class PersonPage extends StatefulWidget {
  final String title;

  const PersonPage({Key key, this.title = "Joao"}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  PersonBloc _loginBloc = PersonModule.to.getBloc<PersonBloc>();

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
            Text("teste person"),
          ],
        ),
      ),
    );
  }
}
