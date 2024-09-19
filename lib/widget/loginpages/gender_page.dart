import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:aplikacija/models/gender_model.dart';
import 'package:aplikacija/widget/loginpages/widget/select_pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  List<PetsGenderModel> genderList = [
    PetsGenderModel(petsPicture: "assets/boy.png", petsG: "Boy"),
    PetsGenderModel(petsPicture: "assets/girl.png", petsG: "Girl"),
  ];
  void initState() {
    // TODO: implement initState

    gender = genderList.first;
    super.initState();
  }

  late PetsGenderModel gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 255, 220, 132),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Name is?",
                    style: TextStyle(
                      //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                      fontSize: 30,
                      color: Color.fromARGB(255, 102, 183, 187),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: BlocBuilder<PetBloc, PetState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...genderList.map(
                    (e) => Expanded(
                      child: SelectPet(
                        picture: e.petsPicture,
                        selected: state.newPet.petsGender == e.petsG,
                        onTap: () {
                          context
                              .read<PetBloc>()
                              .add(AddGenderEvent(gender: e.petsG));
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
