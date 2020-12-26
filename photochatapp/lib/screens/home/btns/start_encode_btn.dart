import 'package:flutter/material.dart';
import 'package:photochatapp/services/context/app_context.dart';
import 'package:photochatapp/services/i18n/i18n.dart';
import 'package:provider/provider.dart';

/// Home Screen Start Encode Button
///
/// {@category Screens: Home}
class HomeScreenStartEncodeBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xff5a5a5c),
      onPressed: Provider.of<AppContext>(context).isReady()
          ? () {
              Navigator.pushNamed(context, '/send');
            }
          : null,
      key: Key('home_screen_encode_message_btn'),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("ENCODE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
