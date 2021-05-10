import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/model/personDoc.dart';
import 'package:flutter/material.dart';

import 'documents_bloc.dart';
import 'documents_page.dart';

class DocumentsModule extends ModuleWidget {
  PersonDoc personDoc;

  Function callback;

  DocumentsModule(this.personDoc,this.callback);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => DocumentsBloc(personDoc)),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DocumentsPage(personDoc, callback);

  static Inject get to => Inject<DocumentsModule>.of();
}
