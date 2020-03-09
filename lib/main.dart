import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quadrant/i18n/app_messages.dart';
import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quadrant',
      localizationsDelegates: [
        AppMessages.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorLight: Colors.white,
        primaryColorDark: Color(0xffcccccc),
        accentColor: Color(0xff3ddc84),
      ),
      home: LoginScreen(title: 'Quadrant'),
    );
  }
}