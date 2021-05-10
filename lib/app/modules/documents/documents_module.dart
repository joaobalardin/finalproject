import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'documents_bloc.dart';
import 'documents_page.dart';

class DocumentsModule extends ModuleWidget {
  String id;

  Function callback;

  DocumentsModule(this.id,this.callback);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => DocumentsBloc(id)),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DocumentsPage(callback);

  static Inject get to => Inject<DocumentsModule>.of();
}
