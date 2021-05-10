import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/bloc/person_doc_bloc.dart';
import 'package:finalproject/app/model/personDoc.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc extends BlocBase {
  BehaviorSubject <List<PersonDoc>> listDocBehaviorSubject = new BehaviorSubject();
  PersonDocBloc personDocBloc = new PersonDocBloc();
  login(BuildContext context, String username) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkSelectModule(),
      ),
    );
  }

  findPersonDocs() async {
    listDocBehaviorSubject.add(await personDocBloc.findAll());
  }
}
