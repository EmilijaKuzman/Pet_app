import 'dart:js';

import 'package:aplikacija/widget/signinpages/my_button.dart';
import 'package:aplikacija/widget/signinpages/my_textfiled.dart';
import 'package:aplikacija/widget/signinpages/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  /* final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }
  // sign user in method

  void errorMessage(String mess) {
    /* showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(mess),
        );
      },
    );*/
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Container(
        color: Colors.amber,
      )
          /*  Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo

                const SizedBox(height: 50),

                // welcome back, you've been missed!

                Text(
                  'Receive an email to \nreset your password.',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield

                // forgot password?

                const SizedBox(height: 25),

                // sign in button

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.email_outlined),
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
    */
          ),
    );
  }

  /* Future verifyEmail() async {
    /*  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));*/
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: usernameController.text.trim());
    } on FirebaseAuthException catch (e) {
      //errorMessage(e.code);
    }
  }*/
}
