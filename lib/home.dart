import 'package:aplikacija/pet_home.dart';
import 'package:aplikacija/started_page.dart';
import 'package:aplikacija/widget/loginpages/widget/app_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            IconButton(
              onPressed: signUserOut,
              icon: Icon(
                Icons.logout,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home.png"), fit: BoxFit.cover),
            ),
            //color: const Color.fromARGB(255, 3, 152, 158),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage("assets/welcome.png"),
                              fit: BoxFit.cover),
                        ),
                      ),

                      //  const Expanded(
                      //    flex: 2,
                      //  child:
                      const Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 45,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Text(
                              "TO",
                              style: TextStyle(
                                fontSize: 45,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            AppName(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //   ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StartedPage()));
                          //builder: (context) => PetHome()));
                        },
                        child: Container(
                          height: 80,
                          //width: 300,
                          width: 200,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Color.fromARGB(255, 197, 140, 113),
                          ),
                          child: const Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => StartedPage()));
                                  builder: (context) => PetHome()));
                        },
                        child: Container(
                          height: 80,
                          width: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Color.fromARGB(255, 197, 140, 113),
                          ),
                          child: const Center(
                            child: Text(
                              "HomePet",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
