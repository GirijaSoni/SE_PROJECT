import 'package:flutter/material.dart';
import 'package:photochatapp/components/btn_logo/btn_logo_with_loading_error.dart';
import 'package:photochatapp/services/i18n/i18n.dart';
import 'package:photochatapp/services/states/loading_states.dart';

typedef Future<void> OnUploadHandler();

/// Receive Screen Pick From Gallery Button
///
/// {@category Screens: Receive}
class ReceiveScreenGallertyImageBtn extends StatelessWidget {
  final OnUploadHandler onUploadHandler;
  final LoadingState loadingState;
  const ReceiveScreenGallertyImageBtn({
    @required this.onUploadHandler,
    @required this.loadingState,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Color(0xff5a5a5c),
        key: Key('decode_pick_image_from_gallery_btn'),
        onPressed: this.onUploadHandler,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("GALLERY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
