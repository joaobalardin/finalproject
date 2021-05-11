import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/model/coopDoc.dart';
import 'package:flutter/material.dart';

import 'documents_bloc.dart';
import 'documents_page.dart';

class DocumentsModule extends ModuleWidget {
  CoopDoc coopDoc;

  Function callback;

  DocumentsModule(this.coopDoc,this.callback);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => DocumentsBloc(coopDoc)),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DocumentsPage(coopDoc, callback);

  static Inject get to => Inject<DocumentsModule>.of();
}
