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
    images =
        await Provider.of<DatabaseService>(context, listen: false).getImages();
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
                  print("hey");
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
