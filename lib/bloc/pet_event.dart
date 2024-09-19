// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pet_bloc.dart';

@immutable
sealed class PetEvent {}

class AddNameEvent extends PetEvent {
  final String name;
  AddNameEvent({
    required this.name,
  });
}

class AddGenderEvent extends PetEvent {
  final String gender;
  AddGenderEvent({
    required this.gender,
  });
}

class AddBirthdayEvent extends PetEvent {
  final DateTime date;
  AddBirthdayEvent({
    required this.date,
  });
}

class AddTypeEvent extends PetEvent {
  final String type;
  AddTypeEvent({
    required this.type,
  });
}

class AddBreedEvent extends PetEvent {
  final String breed;
  AddBreedEvent({
    required this.breed,
  });
}

class AddCityEvent extends PetEvent {
  final String city;
  AddCityEvent({
    required this.city,
  });
}

class AddPictureEvent extends PetEvent {
  final File image;
  AddPictureEvent({
    required this.image,
  });
}

class AddNewPetEvent extends PetEvent {}

class LoadSortPetsEvent extends PetEvent {}

class LoadYourPets extends PetEvent {}
