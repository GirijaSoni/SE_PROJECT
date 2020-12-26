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

  Future<List<String>> getImages() async {
    List<String> images = [];
    await userCollection.doc(uid).collection("Images").get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        images.add(ds.data()['image']);
      }
    });
    return images;
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
