import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:finalproject/app/model/personDoc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'documents_bloc.dart';
import 'documents_module.dart';

class DocumentsPage extends StatefulWidget {
  final String title;

  final Function callback;

  final PersonDoc personDoc;

  const DocumentsPage(this.personDoc, this.callback,
      {Key key, this.title = "Joao"})
      : super(key: key);

  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  DocumentsBloc _documentsBloc = DocumentsModule.to.getBloc<DocumentsBloc>();

  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleTextController.text =
        widget.personDoc == null ? null : widget.personDoc.title;
    _contentTextController.text =
        widget.personDoc == null ? null : widget.personDoc.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chatbox"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            TextField(
              controller: _titleTextController,
              style: TextStyle(fontSize: 25),
              decoration: const InputDecoration(
                hintText: 'Titulo',
                border: InputBorder.none,
                counter: const SizedBox(),
              ),
              maxLines: null,
              maxLength: 1024,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 14),
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: 17),
                controller: _contentTextController,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Conteudo'),
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Container(
              child: SubmitWidget(() async {
                await _documentsBloc.saveDocuments(
                    _titleTextController.text, _contentTextController.text);
                widget.callback();
                Navigator.pop(context);
              }, text: "Concluir"),
              padding: EdgeInsets.only(bottom: 10),
            )
          ]),
        ));
  }
}
