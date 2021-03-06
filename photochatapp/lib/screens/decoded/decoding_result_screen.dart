import 'package:flutter/material.dart';
import 'package:photochatapp/components/screen_adapter/screen_adapter.dart';
import 'package:photochatapp/services/decoder.dart';
import 'package:photochatapp/services/i18n/i18n.dart';
import 'package:photochatapp/services/requests/decode_request.dart';
import 'package:photochatapp/services/responses/decode_response.dart';

/// Decode Result Screen
///
/// {@category Screens}
/// {@category Screens: Decode Result}
class DecodingResultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DecodingResultScreen();
  }
}

class _DecodingResultScreen extends State<DecodingResultScreen> {
  Future<String> decodedMsg;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      DecodeRequest req = ModalRoute.of(context).settings.arguments;
      decodedMsg = this.decodeMsg(req);
    }
  }

  Future<String> decodeMsg(DecodeRequest req) async {
    DecodeResponse response =
        await decodeMessageFromImageAsync(req, context: context);
    String msg = response.decodedMsg;
    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff303030),
        appBar: AppBar(
          backgroundColor: Color(0xff231f20),
          title: Text(AppLocalizations.of(context).decodeResultScreenTitle,style: TextStyle(color: Colors.white)),
          leading: IconButton(
              key: Key('decoded_screen_back_btn'),
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        resizeToAvoidBottomInset: false,
        body: ScreenAdapter(
          child: FutureBuilder<String>(
              future: this.decodedMsg,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Text(
                            'Decoded Message: ',
                            style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              snapshot.data,
                              style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Center(
                              child: Text(
                            'Whoops >_<',
                            style: TextStyle(fontSize: 30.0,color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Center(
                              child: Text('It seems something went wrong',style: TextStyle(fontSize: 30.0,color: Colors.white),)),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                      ],
                    ),
                  );
                } else {
                  return Container(
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),

                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                          child: Text(
                              'Decoding your message...',style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ));
  }
}
