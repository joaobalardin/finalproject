import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'workselect_bloc.dart';
import 'workselect_page.dart';

class WorkSelectModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => WorkSelectBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => WorkSelectPage();

  static Inject get to => Inject<WorkSelectModule>.of();
}
