import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "In which city does Name live?",
                  style: TextStyle(
                      //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                      fontSize: 30,
                      color: Color.fromARGB(255, 102, 183, 187)),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: BlocBuilder<PetBloc, PetState>(
                    builder: (context, state) {
                      return DropdownSearch<String>(
                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<PetBloc>()
                                .add(AddCityEvent(city: value));
                          }
                        },
                        items: state.city,
                        selectedItem: state.newPet.petsCity,
                        popupProps: const PopupPropsMultiSelection.menu(
                          menuProps: MenuProps(
                              backgroundColor:
                                  Color.fromARGB(255, 252, 230, 164)),
                          showSearchBox: true,
                        ),
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          baseStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 15, 138, 145),
                          ),
                          dropdownSearchDecoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              filled: true),
                        ),
                      );
                    },
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
