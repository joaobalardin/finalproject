import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SubmitWidget extends StatelessWidget {
  Function _execute;
  Function _validate;
  String text;
  bool primary;

  SubmitWidget(this._execute, {this.text, this.primary: true, validate})
      : this._validate = validate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {
                if (_validate == null || _validate()) {
                  final pr = ProgressDialog(context,
                      showLogs: true, isDismissible: false);
                  pr.show().then((value) {
                    _execute();
                    pr.hide();
                  });
                }
              },
              child: Text(text ?? "Enviar"),
            ),
          ),
        ],
      ),
    );
  }
}
