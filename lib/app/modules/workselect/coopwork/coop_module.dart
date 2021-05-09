import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'coop_bloc.dart';
import 'coop_page.dart';

class CoopModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CoopBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CoopPage();

  static Inject get to => Inject<CoopModule>.of();
}
