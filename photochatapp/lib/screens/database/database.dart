import 'package:flutter/material.dart';
class Database extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Database();
  }
  
}

class _Database extends State<Database> {
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      appBar: AppBar(
        backgroundColor: Color(0xff231f20),
        title: Text("Your images",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
    controller: scrollController,
    itemCount: 3,
    itemBuilder: (BuildContext context, int index) {
          print("hey");
          return Padding(padding: EdgeInsets.all(10),
          child:Image.network("https://www.computerhope.com/jargon/s/software-engineering.jpg",height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width*0.9,
          ),);


    })
    );
  }
}