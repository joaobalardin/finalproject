import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:flutter/material.dart';

import 'workselect_bloc.dart';
import 'workselect_module.dart';

class WorkSelectPage extends StatefulWidget {
  final String title;

  const WorkSelectPage({Key key, this.title = "Joao"}) : super(key: key);

  @override
  _WorkSelectPageState createState() => _WorkSelectPageState();
}

class _WorkSelectPageState extends State<WorkSelectPage> {
  WorkSelectBloc _workSelectBloc = WorkSelectModule.to.getBloc<WorkSelectBloc>();

  String username;

  @override
  void initState() {
    super.initState();
    username = "joao";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbox"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCard("Pessoal", () => _workSelectBloc.selecionaPessoal(context, )),
            buildCard("Compartilhado", () => _workSelectBloc.selecionaCompartilhado(context, )),
          ],
        ),
      ),
    );
  }

  buildCard(String texto, Function selecionaTrabalho) {
    return Row(
      children: [
        Expanded(
            child: Card(
                child: InkWell(
                  onTap: () => selecionaTrabalho(),
                    child: Container(
          child: Text(texto),
          padding: EdgeInsets.all(10),
        ))))
      ],
    );
  }
}
