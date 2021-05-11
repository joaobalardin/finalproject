import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/model/coopDoc.dart';
import 'package:finalproject/app/utils/loggedUser.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoopDocBloc extends BlocBase {
  CollectionReference firebaseRef = FirebaseFirestore.instance.collection('coopDocs');

  LoggedUser loggedUser = new LoggedUser();

  Stream <DocumentSnapshot> watchDocument(String id){
    return firebaseRef.doc(id).snapshots();
  }

  Future<List<CoopDoc>> findAll() async {
    log(loggedUser.user.id);
    QuerySnapshot snapshot = await firebaseRef.where("users", arrayContains: loggedUser.user.id).get();
    List <CoopDoc> coopDocs = [];
    snapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      CoopDoc coopDoc = CoopDoc.fromMap(element.id ,map);
      coopDocs.add(coopDoc);
    });
    return coopDocs;
  }

  Future<String> create(CoopDoc coopDoc) async {
    return (await firebaseRef.add(coopDoc.toMap())).id;
  }

  Future<void> update(CoopDoc coopDoc) async {
    await firebaseRef.doc(coopDoc.id).update(coopDoc.toMap());
  }
}
