import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/modules/workselect/workselect_module.dart';
import 'package:flutter/material.dart';

class CoopBloc extends BlocBase {
  login(BuildContext context, String username) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkSelectModule(),
      ),
    );
  }
}
