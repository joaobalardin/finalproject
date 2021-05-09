import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/modules/workselect/coopwork/coop_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'personwork/person_module.dart';

class WorkSelectBloc extends BlocBase {
  selecionaPessoal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PersonModule(),
      ),
    );
  }

  selecionaCompartilhado(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CoopModule(),
      ),
    );
  }
}
