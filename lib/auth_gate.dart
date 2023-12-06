import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:iris_app/loginmain.dart';

import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers:[
              EmailAuthProvider(),
            ]
          );
        }

        return const HomeScreen();
      },
    );
  }
}
//Link da página do Firebase ao respeito: https://firebase.google.com/codelabs/firebase-auth-in-flutter-apps?hl=pt-br#3