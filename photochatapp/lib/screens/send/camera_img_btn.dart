import 'package:flutter/material.dart';
import 'package:photochatapp/components/btn_logo/btn_logo_with_loading_error.dart';
import 'package:photochatapp/services/i18n/i18n.dart';
import 'package:photochatapp/services/states/loading_states.dart';

typedef Future<void> OnOpenHandler();

/// Camera Image Picker Button
///
/// {@category Screens: Send}
class SendScreenCameraImageBtn extends StatelessWidget {
  /// The function that gets called when the take photo
  /// with camera button is clicked
  final OnOpenHandler onOpenHandler;

  /// The [LoadingState] that corresponding to
  /// the progress of the random image fetching.
  final LoadingState loadingState;
  const SendScreenCameraImageBtn({
    @required this.onOpenHandler,
    @required this.loadingState,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: this.onOpenHandler,
        color: Color(0xff5a5a5c),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("CAMERA",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
