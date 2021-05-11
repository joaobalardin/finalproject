import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'user_bloc.dart';
import 'user_page.dart';

class UserModule extends ModuleWidget {
  String coopDocumentId;


  UserModule(this.coopDocumentId);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => UserPageBloc(coopDocumentId)),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => UserPage();

  static Inject get to => Inject<UserModule>.of();
}
