import 'dart:developer';

import 'package:finalproject/app/app_module.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          log("Deu Erro");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AppModule();
        }

        return MaterialApp(
          title: 'Flutter Slidy',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Container(
            child: Text("Carregando"),
          ),
        );
      },
    );
  }
}