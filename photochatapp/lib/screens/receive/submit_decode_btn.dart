import 'package:flutter/material.dart';
import 'package:photochatapp/services/i18n/i18n.dart';

typedef void OnSubmitDecodeHandler();

/// Receive Screen Send to Decode Button
///
/// {@category Screens: Receive}
class ReceiveScreenSubmitDecodeBtn extends StatelessWidget {
  final OnSubmitDecodeHandler onSubmitDecodeHandler;
  const ReceiveScreenSubmitDecodeBtn({@required this.onSubmitDecodeHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
          color: Color(0xff5a5a5c),
      key: Key('decode_screen_decode_btn'),
      onPressed: this.onSubmitDecodeHandler,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("DECODE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ));
  }
}
