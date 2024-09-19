// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pet_bloc.dart';

enum Status { initial, load, loaded, error }

@immutable
class PetState {
  final PetModel newPet;
  final Status status;
  final String? error;
  final List<PetsToSelectModel> listPets;
  final List<String> breed;
  final List<String> city;
  final List<PetModel> yourPetsList;
  const PetState({
    required this.newPet,
    required this.status,
    this.error,
    this.listPets = const [],
    this.breed = const [],
    this.city = const [],
    this.yourPetsList = const [],
  });

  PetState copyWith({
    PetModel? newPet,
    Status? status,
    String? error,
    List<PetsToSelectModel>? listPets,
    List<String>? breed,
    List<String>? city,
    List<PetModel>? yourPetsList,
  }) {
    return PetState(
      newPet: newPet ?? this.newPet,
      status: status ?? this.status,
      error: error ?? this.error,
      listPets: listPets ?? this.listPets,
      breed: breed ?? this.breed,
      city: city ?? this.city,
      yourPetsList: yourPetsList ?? this.yourPetsList,
    );
  }
}
