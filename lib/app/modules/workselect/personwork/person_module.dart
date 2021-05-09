import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'person_bloc.dart';
import 'person_page.dart';

class PersonModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PersonBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => PersonPage();

  static Inject get to => Inject<PersonModule>.of();
}
