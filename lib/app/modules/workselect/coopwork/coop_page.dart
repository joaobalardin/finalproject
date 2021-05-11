import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:finalproject/app/model/coopDoc.dart';

import 'package:flutter/material.dart';

import 'documents/documents_module.dart';
import 'coop_bloc.dart';
import 'coop_module.dart';

class CoopPage extends StatefulWidget {
  final String title;

  const CoopPage({Key key, this.title = "Joao"}) : super(key: key);

  @override
  _CoopPageState createState() => _CoopPageState();
}

class _CoopPageState extends State<CoopPage> {
  CoopBloc _coopBloc = CoopModule.to.getBloc<CoopBloc>();

  @override
  void initState() {
    super.initState();
    _coopBloc.findCoopDocs();
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DocumentsModule(null, () => _coopBloc.findCoopDocs())));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildCard(String texto, CoopDoc coopDoc) {
    return Row(
      children: [
        Expanded(
            child: Card(
                child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DocumentsModule(
                            coopDoc, () => _coopBloc.findCoopDocs()))),
                    child: Container(
                      child: Text(texto),
                      padding: EdgeInsets.all(10),
                    ))))
      ],
    );
  }

  buildList() {
    return StreamBuilder<List<CoopDoc>>(
      stream: _coopBloc.listDocBehaviorSubject.stream,
      builder: (context, snapshot) {
        List<CoopDoc> coopdocs = snapshot.data;
        if (coopdocs == null || coopdocs.isEmpty) return Container();
        List<Widget> widgets =
            coopdocs.map((coopDoc) => buildCard(coopDoc.title, coopDoc)).toList();
        return Column(children: widgets);
      },
    );
  }
}
