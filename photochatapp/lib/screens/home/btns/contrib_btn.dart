import 'package:flutter/material.dart';
import 'package:photochatapp/services/context/app_context.dart';
import 'package:photochatapp/services/i18n/i18n.dart';
import 'package:provider/provider.dart';

/// Home Screen Contribute Button
///
/// {@category Screens: Home}
class HomeScreenContribBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppContext>(context).isIos()) {
      return Container();
    }
    return RaisedButton(
      onPressed:  () {
              // Navigator.pushNamed(context, '/contribute');
  }
        ,
      key: Key('home_screen_contribute_btn'),
      color:Color(0xff5a5a5c),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("DATABASE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
