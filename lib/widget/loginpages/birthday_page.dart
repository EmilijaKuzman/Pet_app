import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      if (mounted) {
        context.read<PetBloc>().add(AddBirthdayEvent(date: date));
      }
    }
  }

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
                "Name's birthday is?",
                style: TextStyle(
                    //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                    fontSize: 30,
                    color: Color.fromARGB(255, 102, 183, 187)),
              ),
            ),
          ),
          Container(
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/birth.png"),
                  fit: BoxFit.cover,
                  scale: 1.5),
            ),
          ),
          Container(
            width: 300,
            color: const Color.fromARGB(221, 255, 255, 255),
            child: ListTile(
              title: BlocBuilder<PetBloc, PetState>(
                builder: (context, state) {
                  final date = state.newPet.petsBirthday;
                  return Text(
                      "Date: ${date?.year}, ${date?.month}, ${date?.day}");
                },
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
          )
        ],
      ),
    );
  }
}
