import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/bloc/user_bloc.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';

class UserPageBloc extends BlocBase {
  UserBloc userBloc = new UserBloc();

  String coopDocumentId;

  UserPageBloc(this.coopDocumentId);

  findById(){

  }
}
