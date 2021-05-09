import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:flutter/material.dart';

import 'coop_bloc.dart';
import 'coop_module.dart';

class CoopPage extends StatefulWidget {
  final String title;

  const CoopPage({Key key, this.title = "Joao"}) : super(key: key);

  @override
  _CoopPageState createState() => _CoopPageState();
}

class _CoopPageState extends State<CoopPage> {
  CoopBloc _loginBloc = CoopModule.to.getBloc<CoopBloc>();

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
            Text("teste coop"),
          ],
        ),
      ),
    );
  }
}
