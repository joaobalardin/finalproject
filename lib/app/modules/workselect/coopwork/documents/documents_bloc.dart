import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/app/bloc/coop_doc_bloc.dart';
import 'package:finalproject/app/model/coopDoc.dart';
import 'package:finalproject/app/utils/loggedUser.dart';

class DocumentsBloc extends BlocBase {
  CoopDocBloc coopDocBloc = new CoopDocBloc();
  CoopDoc coopDoc;

  Stream<DocumentSnapshot> docStream;

  DocumentsBloc(this.coopDoc) {
    if (coopDoc != null) {
      docStream = coopDocBloc.watchDocument(coopDoc.id);
    } else {
      docStream = new Stream.empty();
      coopDoc = new CoopDoc(users: [LoggedUser().user.id]);
      saveDocuments("", "");
    }
  }

  saveDocuments(String title, String content) async {
    if (coopDoc.id == null) {
      coopDoc.id = await coopDocBloc.create(new CoopDoc(title: title, content: content,));
    }else
      await coopDocBloc
          .update(coopDoc);
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
