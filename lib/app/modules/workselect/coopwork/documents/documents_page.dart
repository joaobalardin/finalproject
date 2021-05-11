import 'dart:developer';

import 'package:finalproject/app/components/submit_widget.dart';
import 'package:finalproject/app/components/text_input_widget.dart';
import 'package:finalproject/app/model/coopDoc.dart';
import 'package:finalproject/app/utils/position_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'documents_bloc.dart';
import 'documents_module.dart';

class DocumentsPage extends StatefulWidget {
  final String title;

  final Function callback;

  final CoopDoc coopDoc;

  const DocumentsPage(this.coopDoc, this.callback,
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
        widget.coopDoc == null ? null : widget.coopDoc.title;
    _contentTextController.text =
        widget.coopDoc == null ? null : widget.coopDoc.content;
    _documentsBloc.docStream.listen((event) {
      if (this.mounted) {
          _titleTextController.value = TextEditingValue(
            text: event.data()["title"],
            selection: TextSelection.fromPosition(
              TextPosition(offset: PositionUtil.findPosition(_titleTextController.text, event.data()["title"], _titleTextController.selection.start)),
            ),
          );
          _contentTextController.value = TextEditingValue(
            text: event.data()["content"],
            selection: TextSelection.fromPosition(
              TextPosition(offset: event.data()["content"].length),
            ),
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
            child: Icon(Icons.person_add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  // builder: (context) =>
                  //     DocumentsModule(null, () => _coopBloc.findCoopDocs()))
                  ));
            }),
      ),
      appBar: AppBar(
        title: Text("Chatbox"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        TextField(
          onChanged: (title) {
            _documentsBloc.updateTitle(title);
            log(""+_titleTextController.selection.start.toString());
          },
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
            onChanged: (content) => _documentsBloc.updateContent(content),
            style: TextStyle(fontSize: 17),
            controller: _contentTextController,
            decoration: const InputDecoration.collapsed(hintText: 'Conteudo'),
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
    );
  }

  List<Widget> buildForm() {
    return [
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
          decoration: const InputDecoration.collapsed(hintText: 'Conteudo'),
          maxLines: null,
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
    ];
  }
}
