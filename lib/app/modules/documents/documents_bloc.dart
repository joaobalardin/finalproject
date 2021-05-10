import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/bloc/person_doc_bloc.dart';
import 'package:finalproject/app/bloc/user_bloc.dart';
import 'package:finalproject/app/model/personDoc.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';

class DocumentsBloc extends BlocBase {
  PersonDocBloc personDocBloc = new PersonDocBloc();
  String id;

  DocumentsBloc(this.id);

  saveDocuments(String title, String content) async {
    if (id == null)
      await personDocBloc.create(new PersonDoc(title: title, content: content));
    else
      await personDocBloc.update(
          new PersonDoc(id: id, title: title, content: content));
  }
}
