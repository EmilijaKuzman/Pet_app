import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:aplikacija/widget/loginpages/widget/select_pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypePage extends StatefulWidget {
  const TypePage({super.key});

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  /*List<String> listPets = [
    "assets/cat.png",
    "assets/dog.png",
  ];*/
  @override
  /* void initState() {
    // TODO: implement initState
    pet = listPets.first;
    super.initState();
  }*/

  // late String pet;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        "What kind of a pet do you have?",
                        style: TextStyle(
                            //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                            fontSize: 30,
                            color: Color.fromARGB(255, 102, 183, 187)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 15,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: BlocBuilder<PetBloc, PetState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...state.listPets.map((e) => SelectPet(
                                picture: e.petsPicture,
                                selected: state.newPet.petsType == e.petsSort,
                                onTap: () {
                                  context
                                      .read<PetBloc>()
                                      .add(AddTypeEvent(type: e.petsSort));
                                },
                              ))
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
