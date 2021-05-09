import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  String _label;
  Function callback;
  EdgeInsets padding;
  bool primary;
  String value;
  bool mandatory;

  TextInputWidget(this._label,
      {this.callback, this.padding, this.value, this.mandatory: false});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: TextFormField(
          decoration: new InputDecoration(
            labelText: _label,
          ),
          initialValue: value ?? "",
          onChanged: callback,
          validator: (value) {
            if (value.isEmpty && mandatory) {
              return 'Campo obrigatório';
            }
            return null;
          },
        ));
  }
}
