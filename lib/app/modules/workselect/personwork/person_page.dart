import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:finalproject/app/model/personDoc.dart';
import 'package:finalproject/app/modules/documents/documents_module.dart';
import 'package:flutter/material.dart';

import 'person_bloc.dart';
import 'person_module.dart';

class PersonPage extends StatefulWidget {
  final String title;

  const PersonPage({Key key, this.title = "Joao"}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  PersonBloc _personBloc = PersonModule.to.getBloc<PersonBloc>();

  @override
  void initState() {
    super.initState();
    _personBloc.findPersonDocs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chatbox"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: buildList(),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DocumentsModule(null,() => _personBloc.findPersonDocs())));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildCard(String texto, Function selecionaTrabalho) {
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

  buildList() {
    return StreamBuilder<List<PersonDoc>>(
      stream: _personBloc.listDocBehaviorSubject.stream,
      builder: (context, snapshot) {
        List<PersonDoc> persondocs = snapshot.data;
        if(persondocs == null || persondocs.isEmpty)
          return Container();
        List<Widget> widgets =
            persondocs.map((e) => buildCard(e.title, null)).toList();
        return Column(children: widgets);
      },
    );
  }
}
