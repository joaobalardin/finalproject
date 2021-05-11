// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:finalproject/app/utils/position_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finalproject/main.dart';

void main() {
  test('Quando entrada de dados somente apos, retorna mesma posicao', () async {
    String textoAnterior = "test";
    String textoAtual = "test1";
    int posicaoAnterior = 4;

    expect(PositionUtil.findPosition(textoAnterior, textoAtual, posicaoAnterior), equals(4));
  });


  test('quando apagado, posicao - apagado', () async {
    String textoAnterior = "test1";
    String textoAtual = "test";
    int posicaoAnterior = 5;

    expect(PositionUtil.findPosition(textoAnterior, textoAtual, posicaoAnterior), equals(4));
  });

  test('quando entrada mt diferente, retorna posicao anterior', () async {
    String textoAnterior = "test123";
    String textoAtual = "tes23";
    int posicaoAnterior = 5;

    expect(PositionUtil.findPosition(textoAnterior, textoAtual, posicaoAnterior), equals(5));
  });
}
