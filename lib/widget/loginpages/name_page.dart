import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final nameCon = TextEditingController();
  String text = "";
  int maxLength = 25;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 255, 220, 132),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "What’s your pet name?",
                style: TextStyle(
                    //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                    fontSize: 30,
                    color: Color.fromARGB(255, 102, 183, 187)),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("assets/name.png"), fit: BoxFit.cover),
                ),
                child: Center(
                  child: TextField(
                    onChanged: (value) {
                      context.read<PetBloc>().add(AddNameEvent(name: value));
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      constraints: BoxConstraints(
                        maxHeight: 48,
                        maxWidth: 250,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
