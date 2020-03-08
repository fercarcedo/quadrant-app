import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {

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
              child: FlareActor("assets/mailsent.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: 'Animations')
            )
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Verify your email', style: TextStyle(fontSize: 34), textAlign: TextAlign.center),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("We've sent you a verification email. Click the link inside it in order to verify your account. Once done, you can tap on login to start using the app", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
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
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: RaisedButton(child: Text('RESEND'), onPressed: (){}, color: Theme.of(context).accentColor)
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: RaisedButton(child: Text('LOGIN'), onPressed: (){}, color: Theme.of(context).accentColor)
                )
              ]
            )
          )
        ],
      )
    );
  }
}