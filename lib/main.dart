import 'package:flutter/material.dart';
import 'package:pricetracker_client/screens/signinpage.dart';
import 'package:pricetracker_client/screens/signuppage.dart';
import 'package:pricetracker_client/services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:pricetracker_client/screens/homepage.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  User myUser = User(
    id: 33,
    email: 'ok@email.com',
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Authentication(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
        
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = context.watch<Authentication>().currentUser;
    if (currentUser != null) {
      return HomePage(user:currentUser);
    } else {
      return const AuthScreen();
    }
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool haveAccount = context.watch<Authentication>().haveAccount;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: showPage(haveAccount),
      ),
    );
  }

  Widget showPage(bool hasAccount) {
    if (hasAccount) {
      return SignInPage();
    } else {
      return SignUpPage();
    }
  }
}
