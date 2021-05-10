import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/model/personDoc.dart';
import 'package:finalproject/app/utils/loggedUser.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonDocBloc extends BlocBase {
  CollectionReference firebaseRef = FirebaseFirestore.instance.collection('personDocs');

  LoggedUser loggedUser = new LoggedUser();

  Future<List<PersonDoc>> findAll() async {
    log(loggedUser.user.id);
    QuerySnapshot snapshot = await firebaseRef.where("userId", isEqualTo: loggedUser.user.id).get();
    List <PersonDoc> personDocs = [];
    snapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      PersonDoc personDoc = PersonDoc.fromMap(element.id ,map);
      personDocs.add(personDoc);
    });
    return personDocs;
  }

  Future<void> create(PersonDoc personDoc) async {
    await firebaseRef.add(personDoc.toMap());
  }

  Future<void> update(PersonDoc personDoc) async {
    await firebaseRef.doc(personDoc.id).update(personDoc.toMap());
  }
}
