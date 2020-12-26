import 'package:flutter/material.dart';
import 'package:photochatapp/components/screen_adapter/screen_adapter.dart';
import 'package:photochatapp/screens/home/btns/contrib_btn.dart';
import 'package:photochatapp/screens/home/btns/start_decode_btn.dart';
import 'package:photochatapp/screens/home/btns/start_encode_btn.dart';
import 'package:photochatapp/screens/home/logos/donkey_logo.dart';
import 'package:photochatapp/screens/home/logos/message_logo.dart';
import 'package:photochatapp/services/context/app_context.dart';
import 'package:photochatapp/services/i18n/i18n.dart';
import 'package:provider/provider.dart';

/// Home Screen
///
/// {@category Screens}
/// {@category Screens: Home}
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppContext>(context, listen: false).initializeContext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      appBar: AppBar(
        title: Text(
          "Steganography",
          style: TextStyle(color: Colors.white),
          key: Key('home_screen_title'),

        ),
        backgroundColor: Color(0xff231f20),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              }),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: ScreenAdapter(
          child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            Center(child: Text("Steganography!",style: TextStyle(fontSize: 30,color: Colors.white.withOpacity(0.8)),),),
            SizedBox(height: 10,),
            HomeScreenStartEncodeBtn(),

            HomeScreenStartDecodeBtn(),

            HomeScreenContribBtn(),
          ],
        ),
      )),
    );
  }
}
