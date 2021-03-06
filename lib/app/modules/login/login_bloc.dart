import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/bloc/user_bloc.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';

class LoginBloc extends BlocBase {
  UserBloc userBloc = new UserBloc();
  login(BuildContext context, String username) async {
    await userBloc.addUser(username);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkSelectModule(),
      ),
    );
  }
}
