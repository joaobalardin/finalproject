import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/app/bloc/coop_doc_bloc.dart';
import 'package:finalproject/app/bloc/user_bloc.dart';
import 'package:finalproject/app/model/coopDoc.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';

class DocumentsBloc extends BlocBase {
  CoopDocBloc coopDocBloc = new CoopDocBloc();
  CoopDoc coopDoc;

  Stream<DocumentSnapshot> docStream;

  DocumentsBloc(this.coopDoc) {
    if (coopDoc != null) {
      docStream = coopDocBloc.watchDocument(coopDoc.id);
    } else {
      docStream = new Stream.empty();
      coopDoc = new CoopDoc();
    }
  }

  saveDocuments(String title, String content) async {
    if (coopDoc.id == null)
      await coopDocBloc.create(new CoopDoc(title: title, content: content));
    else
      await coopDocBloc
          .update(new CoopDoc(id: coopDoc.id, title: title, content: content));
  }

  void updateTitle(String title) {
    coopDoc.title = title;
    if (coopDoc.id != null) coopDocBloc.update(coopDoc);
  }

  updateContent(String content) {
    coopDoc.content = content;
    if (coopDoc.id != null) coopDocBloc.update(coopDoc);
  }
}
