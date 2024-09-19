import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedPage extends StatefulWidget {
  const BreedPage({super.key});

  @override
  State<BreedPage> createState() => _BreedPageState();
}

class _BreedPageState extends State<BreedPage> {
  final _controller = TextEditingController();
  /* var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
*/
  /*String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<String> options = ['First Item', 'Second Item', 'Third Item'];



  String _value = 'First Item';*/
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  final myKey = GlobalKey<DropdownSearchState<String>>();
  final List<String> myItems = ["1", "2", "3", "4", "5"];
  bool? _popupBuilderSelection = false;
  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
          selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);

    return Column(
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
              "What is Name’s breed?",
              style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                  fontSize: 30,
                  color: Color.fromARGB(255, 102, 183, 187)),
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
                              .add(AddBreedEvent(breed: value));
                        }
                      },
                      selectedItem: state.newPet.petsBreed,
                      items: state.breed,
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
    );
  }
}
