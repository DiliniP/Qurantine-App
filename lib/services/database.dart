import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  Future<void> addData(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return Firestore.instance.collection("users").snapshots();
  }

}
