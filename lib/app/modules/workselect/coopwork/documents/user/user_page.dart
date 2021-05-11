import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:finalproject/app/model/user.dart';
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
    _userBloc.findAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbox"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextInputWidget("Usuário", callback: (text) => _userBloc.updateUsername(text),)),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 15),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _userBloc.adduser(),
                    ),
                  ),
                ],
              ),
              Container(child: buildList(),),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList() {
    return StreamBuilder<List<User>>(
      stream: _userBloc.userBehaviorSubject.stream,
      builder: (context, snapshot) {
        List<User> users = snapshot.data;
        if (users == null || users.isEmpty) return Container();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: users.map((e) => Text(e.username)).toList(),
        );
      },
    );
  }
}
