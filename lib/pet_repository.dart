import 'dart:io';
import 'package:aplikacija/models/pet_city_breed_model.dart';
import 'package:aplikacija/models/pets_to_select_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:aplikacija/models/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetRepository {
  final db = FirebaseFirestore.instance;

  Future<PetModel> addNewPet(PetModel pet) async {
    final l = await db.collection("pet").add(pet.toMap());
    final m = await addPicture(pet.petsImage, l.id);
    await db.collection("pet").doc(l.id).set({
      "petsPicture": m,
    }, SetOptions(merge: true));
    return pet.copyWith(
        id: l.id,
        petsPicture:
            'https://firebasestorage.googleapis.com/v0/b/tasks-921f6.appspot.com/o/${l.id}.jpg');
  }

  Future<String?> addPicture(File? picture, String url) async {
    final storageRef = FirebaseStorage.instance.ref();

// Create a reference to "mountains.jpg"
    final mountainsRef = storageRef.child("$url.jpg");

// Create a reference to 'images/mountains.jpg'
    //final mountainImagesRef = storageRef.child("images/mountains.jpg");

// While the file names are the same, the references point to different files
    // assert(mountainsRef.name == mountainImagesRef.name);
    //assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
    if (picture != null) {
      final a = await mountainsRef.putFile(picture);
      final p = await a.ref.getDownloadURL();
      return p;
    }
  }

  Future<List<PetsToSelectModel>> getSortPets() async {
    final p = await db.collection("petsSort").get();

    return p.docs
        .map((e) => PetsToSelectModel.fromMap({...e.data(), "id": e.id}))
        .toList();
  }

  Future<PetCityBreedModel> getBreedPet() async {
    final p =
        await db.collection("breedCity").doc("7p3FxAerN9vWfY65gDv3").get();

    return PetCityBreedModel.fromMap(p.data()!);
  }

  Future<List<PetModel>> getPets() async {
    final an = await db.collection("pet").get();

    return an.docs
        .map((e) => PetModel.fromMap({...e.data(), "id": e.id}))
        .toList();
  }
}
