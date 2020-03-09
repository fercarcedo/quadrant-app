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
    'Email',
    name: 'email',
    desc: 'Email field label',
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

  String get company => Intl.message(
    'Company',
    name: 'company',
    desc: 'Company',
    locale: localeName
  );

  String get createJoinCompany => Intl.message(
    "Create a new company if you are the manager (a company can only have one user as manager), allowing you to add machines and inspection schedules. Join an existing company if you are an employee",
    name: 'createJoinCompany',
    desc: 'Create or join company screen text',
    locale: localeName
  );

  String get createCompany => Intl.message(
    'CREATE COMPANY',
    name: 'createCompany',
    desc: 'Create company button text',
    locale: localeName
  );

  String get joinCompany => Intl.message(
    'JOIN COMPANY',
    name: 'joinCompany',
    desc: 'Join company button text',
    locale: localeName
  );

  String get verifyEmail => Intl.message(
    'Verify your email',
    name: 'verifyEmail',
    desc: 'Verify email screen text',
    locale: localeName
  );

  String get verificationEmailSent => Intl.message(
    "We've sent you a verification email. Click the link inside it in order to verify your account. Once done, you can tap on continue to start using the app",
    name: 'verificationEmailSent',
    desc: 'Long text explaining that the verification email has been sent and how to verify your account',
    locale: localeName
  );

  String get didntReceiveEmail => Intl.message(
    "Didn't receive the email?",
    name: 'didntReceiveEmail',
    desc: "Didn't receive the email label text",
    locale: localeName
  );

  String get resend => Intl.message(
    'Resend',
    name: 'resend',
    desc: 'Resend verification email button text',
    locale: localeName
  );

  String get continueBtn => Intl.message(
    'CONTINUE',
    name: 'continueBtn',
    desc: 'Continue button text',
    locale: localeName
  );  

  String get scanCompanyCode => Intl.message(
    'Scan company code',
    name: 'scanCompanyCode',
    desc: 'Scan company code screen title',
    locale: localeName
  );

  String get scanCompanyCodeInstructions => Intl.message(
    "Scan the company code from the manager's phone. The manager can access the QR code from the main screen of the app by tapping on the QR button at the top",
    name: 'scanCompanyCodeInstructions',
    desc: 'Scan company code instructions',
    locale: localeName
  );  

  String get scanBtn => Intl.message(
    'SCAN',
    name: 'scanBtn',
    desc: 'Scan button text',
    locale: localeName
  );
}

class AppMessagesDelegate extends LocalizationsDelegate<AppMessages> {
  const AppMessagesDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppMessages> load(Locale locale) => AppMessages.load(Locale("es"));

  @override
  bool shouldReload(AppMessagesDelegate old) => false;
}