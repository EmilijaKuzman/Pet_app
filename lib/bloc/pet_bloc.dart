import 'dart:io';

import 'package:aplikacija/models/pet_city_breed_model.dart';
import 'package:aplikacija/models/pet_model.dart';
import 'package:aplikacija/models/pets_to_select_model.dart';
import 'package:aplikacija/pet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pet_event.dart';
part 'pet_state.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  final PetRepository petRepo;
  PetBloc({required this.petRepo})
      : super(PetState(
            newPet: PetModel(petsBirthday: DateTime.now()),
            status: Status.initial)) {
    on<PetEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddNameEvent>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(
          status: Status.loaded,
          newPet: state.newPet.copyWith(petName: event.name)));
    });
    on<AddGenderEvent>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(
          status: Status.loaded,
          newPet: state.newPet.copyWith(petsGender: event.gender)));
    });
    on<AddBirthdayEvent>((event, emit) {
      // TODO: implement event handler
      if (event.date.isAfter(DateTime.now())) {
        emit(state.copyWith(status: Status.error, error: "error"));
        return;
      }
      emit(state.copyWith(
          status: Status.loaded,
          newPet: state.newPet.copyWith(petsBirthday: event.date)));
    });
    on<AddTypeEvent>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(
          status: Status.loaded,
          newPet: state.newPet.copyWith(petsType: event.type)));
    });
    on<AddBreedEvent>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(
          status: Status.loaded,
          newPet: state.newPet.copyWith(petsBreed: event.breed)));
    });
    on<AddCityEvent>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(
          status: Status.loaded,
          newPet: state.newPet.copyWith(petsCity: event.city)));
    });
    on<AddPictureEvent>((event, emit) async {
      // TODO: implement event handler
      // petRepo.addPicture(event.image);
      emit(state.copyWith(status: Status.load));

      emit(state.copyWith(
          status: Status.loaded,
          newPet: state.newPet.copyWith(petsImage: event.image)));
    });
    on<AddNewPetEvent>((event, emit) async {
      // TODO: implement event handler

      try {
        emit(state.copyWith(status: Status.load));
        final pet = await petRepo.addNewPet(state.newPet);

        emit(state.copyWith(status: Status.loaded, newPet: pet));
      } catch (e) {
        emit(state.copyWith(status: Status.error, error: e.toString()));
      }
    });
    on<LoadSortPetsEvent>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(status: Status.load));
      final listSort = [...await petRepo.getSortPets()];
      //  final allPets = [...await petRepo.getPets()];
      final m = await petRepo.getBreedPet();
      emit(state.copyWith(
        status: Status.loaded,
        listPets: listSort,
        breed: m.listBreed,
        city: m.listCities,
        // yourPetsList: allPets,
      ));
      try {} catch (e) {
        emit(state.copyWith(status: Status.error, error: e.toString()));
      }
    });

    on<LoadYourPets>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(status: Status.load));

      final allPets = [...await petRepo.getPets()];

      emit(state.copyWith(
        status: Status.loaded,
        yourPetsList: allPets,
      ));
      try {} catch (e) {
        emit(state.copyWith(status: Status.error, error: e.toString()));
      }
    });
  }
}
