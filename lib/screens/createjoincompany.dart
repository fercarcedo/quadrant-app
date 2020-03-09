import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

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
                Text('Company', style: TextStyle(fontSize: 34), textAlign: TextAlign.center),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Create a new company if you are the manager (a company can only have one user as manager), allowing you to add machines and inspection schedules. Join an existing company if you are an employee", style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
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
                  child: SizedBox(height: 50, child: RaisedButton(child: Text('CREATE COMPANY'), onPressed: (){}, color: Theme.of(context).accentColor))
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 16),
                  child: SizedBox(height: 50, child: RaisedButton(child: Text('JOIN COMPANY'), onPressed: (){}, color: Theme.of(context).accentColor))
                )
              ]
            )
          )
        ],
      )
    );
  }
}