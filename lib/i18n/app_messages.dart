import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class AppMessages {
  AppMessages(this.localeName);

  static Future<AppMessages> load(Locale locale) {
    final String name = (locale.countryCode == null || locale.countryCode.isEmpty) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return AppMessages(localeName);
    });
  }

  static AppMessages of (BuildContext context) {
    return Localizations.of<AppMessages>(context, AppMessages);
  }

  final String localeName;
  static final AppMessagesDelegate delegate = new AppMessagesDelegate();

  String get appName => Intl.message(
    'Quadrant',
    name: 'appName',
    desc: 'App name',
  );

  String get signIn => Intl.message(
      'Sign in',
      name: 'signIn',
      desc: 'Sign in text',
      locale: localeName
    );

  String get signUp => Intl.message(
    'Sign up',
    name: 'signUp',
    desc: 'Sign up text',
    locale: localeName
  );

  String get name => Intl.message(
    'Name',
    name: 'name',
    desc: 'User name field label',
    locale: localeName
  );

  String get email => Intl.message(
    'E-mail',
    name: 'email',
    desc: 'E-mail field label',
    locale: localeName
  );

  String get password => Intl.message(
    'Password',
    name: 'password',
    desc: 'Password field label',
    locale: localeName
  );

  String get forgotPassword => Intl.message(
    'Forgot password?',
    name: 'forgotPassword',
    desc: 'Forgot password text',
    locale: localeName
  );

  String get signInButton => Intl.message(
    'SIGN IN',
    name: 'signInButton',
    desc: 'Sign in button text',
    locale: localeName
  );

  String get signUpButton => Intl.message(
    'SIGN UP',
    name: 'signUpButton',
    desc: 'Sign up button text',
    locale: localeName
  );

  String get or => Intl.message(
    'or',
    name: 'or',
    desc: 'or text, used as a separator',
    locale: localeName
  );

  String get signInWithGoogle => Intl.message(
    'Sign in with Google',
    name: 'signInWithGoogle',
    desc: 'Sign in with Google button label',
    locale: localeName
  );

  String get submit => Intl.message(
    'Submit',
    name: 'submit',
    desc: 'Submit label',
    locale: localeName
  );

  String get enterEmail => Intl.message(
    'Enter your email',
    name: 'enterEmail',
    desc: 'Enter email description text',
    locale: localeName
  );
}

class AppMessagesDelegate extends LocalizationsDelegate<AppMessages> {
  const AppMessagesDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppMessages> load(Locale locale) => AppMessages.load(locale);

  @override
  bool shouldReload(AppMessagesDelegate old) => false;
}