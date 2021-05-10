import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/bloc/person_doc_bloc.dart';
import 'package:finalproject/app/bloc/user_bloc.dart';
import 'package:finalproject/app/model/personDoc.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';

class DocumentsBloc extends BlocBase {
  PersonDocBloc personDocBloc = new PersonDocBloc();
  PersonDoc personDoc;

  DocumentsBloc(this.personDoc);

  saveDocuments(String title, String content) async {
    if (personDoc == null)
      await personDocBloc.create(new PersonDoc(title: title, content: content));
    else
      await personDocBloc.update(
          new PersonDoc(id: personDoc.id, title: title, content: content));
  }
}
