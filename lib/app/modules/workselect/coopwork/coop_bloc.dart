import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/bloc/coop_doc_bloc.dart';
import 'package:finalproject/app/model/coopDoc.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CoopBloc extends BlocBase {
  BehaviorSubject <List<CoopDoc>> listDocBehaviorSubject = new BehaviorSubject();
  CoopDocBloc coopDocBloc = new CoopDocBloc();

  findCoopDocs() async {
    listDocBehaviorSubject.add(await coopDocBloc.findAll());
  }
}
