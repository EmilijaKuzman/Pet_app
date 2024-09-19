import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:aplikacija/login.dart';
import 'package:aplikacija/models/pet_model.dart';
import 'package:aplikacija/sign_in_page.dart';
import 'package:aplikacija/widget/pets_pages/single_pet.dart';
import 'package:aplikacija/widget/signinpages/sign_in_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetHome extends StatefulWidget {
  PetHome({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  @override
  State<PetHome> createState() => _PetHomeState();
}

class _PetHomeState extends State<PetHome> {
  void initState() {
    context.read<PetBloc>().add(LoadYourPets());
    super.initState();
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  final user = FirebaseAuth.instance.currentUser;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Text(user?.email ?? ""),
            IconButton(
              onPressed: signUserOut,
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInOrRegisterPage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.logout,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Color.fromARGB(118, 0, 0, 0),
          backgroundColor: Color.fromARGB(174, 141, 141, 141),
          label: Text("+ Add pet"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    // builder: (context) => StartedPage()));
                    builder: (context) => Login()));
          },
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            color: const Color.fromARGB(255, 255, 220, 132),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Your pets",
                      style: TextStyle(
                        //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                        fontSize: 30,
                        color: Color.fromARGB(255, 158, 157, 155),
                      ),
                    ),
                  ),
                  BlocBuilder<PetBloc, PetState>(
                    builder: (context, state) {
                      if (state.status == Status.error)
                        return Text(state.error ?? 'error');
                      else if (state.status == Status.load)
                        return Center(child: CircularProgressIndicator());
                      else {
                        return Column(
                          children: [
                            ...state.yourPetsList
                                .map((e) => SinglePet(petSin: e)),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
