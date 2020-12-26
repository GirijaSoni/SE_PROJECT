import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photochatapp/services/DatabaseService.dart';
import 'package:provider/provider.dart';

class Database extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Database();
  }
}

class _Database extends State<Database> {
  ScrollController scrollController;
  List<String> images = [];
  getImages() async {
    images = await DatabaseService(uid: FirebaseAuth.instance.currentUser.uid)
        .getImages();
    setState(() {});
  }

  initState() {
    getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff303030),
        appBar: AppBar(
          backgroundColor: Color(0xff231f20),
          title: Text(
            "Your images",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: images != null
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                controller: scrollController,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      images[index],
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  );
                })
            : CircularProgressIndicator());
  }
}
