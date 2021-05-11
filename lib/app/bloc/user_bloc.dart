import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/model/user.dart';
import 'package:finalproject/app/utils/loggedUser.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBloc extends BlocBase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<User> findById(String id) async {
    DocumentSnapshot snapshot = await users.doc(id).get();
    return User.fromMap(snapshot.id, snapshot.data());
  }

  Future<void> addUser(String username) async {
    bool jaCadastrado = false;
    QuerySnapshot snapshot = await users.get();
    snapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String elementUsername = map["username"];
      if (elementUsername == username) {
        LoggedUser loggedUser = new LoggedUser();
        loggedUser.user = new User(id: element.id, username: username);
        jaCadastrado = true;
      }
    });

    if (jaCadastrado)
      log("Já cadastrado");
    else {
      users.add({
        'username': username,
      }).then((value) {
        LoggedUser loggedUser = new LoggedUser();
        loggedUser.user = new User(id: value.id, username: username);
        print("User Added");
      }).catchError((error) => print("Failed to add user: $error"));
    }
  }

  Future<User> findByUserName(String username) async {
    log(username);
    QuerySnapshot snapshot = await users.where("username", isEqualTo: username).get();
    QueryDocumentSnapshot user = snapshot.docs.firstWhere(
        (element) => element.data()["username"] == username, orElse: () {
      throw ("Usuário não encontrado");
    });
    return User.fromMap(user.id, user.data());
  }
}
