import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future saveImage(String link) async {
    if (link != null) {
      var tokens = userCollection.doc(uid).collection('Images');
      return await tokens.add({
        'image': link,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<String> getNumber() async {
    String number = "";
    await userCollection
        .doc(uid)
        .collection("EmergencyContacts")
        .orderBy("priority")
        .get()
        .then((snapshot) {
      number = snapshot.docs[0].data()['number'];
    });
    print("num");
    print(number);
    return number;
  }

  Future updateUserData(String fname, String lname, String email) async {
    return await userCollection.doc(uid).set({
      "fname": fname,
      "lname": lname,
      "email": email,
      "createdOn": DateTime.now()
    });
  }
}
