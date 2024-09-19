import 'package:aplikacija/home.dart';
import 'package:aplikacija/sign_in_page.dart';
import 'package:aplikacija/widget/signinpages/sign_in_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return SignInOrRegisterPage();
          }
        },
      ),
    );
  }
}
