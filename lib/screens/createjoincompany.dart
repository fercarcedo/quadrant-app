import 'package:animations/animations.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:quadrant/i18n/app_messages.dart';
import 'package:quadrant/screens/scanqrinstructions.dart';
import 'package:quadrant/screens/util/sharedaxisroute.dart';

class CreateJoinCompanyScreen extends StatelessWidget {

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
              child: FlareActor("assets/Building.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: 'Animations')
            )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppMessages.of(context).company, style: TextStyle(fontSize: 34), textAlign: TextAlign.center),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(AppMessages.of(context).createJoinCompany, style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
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
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: SizedBox(height: 50, child: RaisedButton(child: Text(AppMessages.of(context).createCompany), onPressed: (){}, color: Theme.of(context).accentColor))
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 16),
                  child: SizedBox(height: 50, child: RaisedButton(child: Text(AppMessages.of(context).joinCompany), onPressed: (){
                    final route = SharedAxisPageRoute(page: ScanQrInstructions(), transitionType: SharedAxisTransitionType.horizontal);
                    Navigator.push(context, route);
                  }, color: Theme.of(context).accentColor))
                )
              ]
            )
          )
        ],
      )
    );
  }
}