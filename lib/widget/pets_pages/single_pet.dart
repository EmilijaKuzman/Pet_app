import 'package:aplikacija/models/pet_model.dart';
import 'package:flutter/material.dart';

class SinglePet extends StatefulWidget {
  PetModel petSin;
  SinglePet({super.key, required this.petSin});

  @override
  State<SinglePet> createState() => _SinglePetState();
}

class _SinglePetState extends State<SinglePet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 141, 141, 141),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.petSin.petName ?? "",
                    style: const TextStyle(
                      //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 220, 132),
                    ),
                  ),
                  Text(
                    "${widget.petSin.petsType}, ${widget.petSin.petsGender}",
                    style: const TextStyle(
                      //backgroundColor: Color.fromARGB(255, 255, 220, 132),
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 220, 132),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/petpicture.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 85,
                      width: 85,
                      margin: EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: NetworkImage(widget.petSin.petsPicture ?? ""),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
