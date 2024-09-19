import 'package:aplikacija/sign_in_page.dart';
import 'package:aplikacija/widget/signinpages/register_page.dart';
import 'package:flutter/material.dart';

class SignInOrRegisterPage extends StatefulWidget {
  const SignInOrRegisterPage({super.key});

  @override
  State<SignInOrRegisterPage> createState() => _SignInOrRegisterPageState();
}

class _SignInOrRegisterPageState extends State<SignInOrRegisterPage> {
  bool showSignInPage = true;

  void togglePages() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
