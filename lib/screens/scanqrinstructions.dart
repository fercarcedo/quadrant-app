import 'package:barcode_scan/barcode_scan.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quadrant/i18n/app_messages.dart';
import 'package:flutter/services.dart';

class ScanQrInstructions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 200,
              height: 200, 
              child: FlareActor("assets/scanqr.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: 'Animations')
            )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppMessages.of(context).scanCompanyCode, style: TextStyle(fontSize: 34), textAlign: TextAlign.center),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(AppMessages.of(context).scanCompanyCodeInstructions, style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
                ),
              ]
            )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 16),
                  child: SizedBox(height: 50, child: RaisedButton(
                    child: Text(AppMessages.of(context).scanBtn), 
                    onPressed: (){
                      scan();
                    }, 
                    color: Theme.of(context).accentColor
                  ))
                )
              ]
            )
          )
        ],
      )
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      Fluttertoast.showToast(msg: barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        Fluttertoast.showToast(msg: 'The user did not grant the camera permission');
      } else {
        Fluttertoast.showToast(msg: 'Error: $e');
      }
    } on FormatException{
      Fluttertoast.showToast(msg: 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e');
    }
  }
}