// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class PetModel {
  String? id;
  String? petName;
  String? petsGender;
  DateTime? petsBirthday;
  String? petsType;
  String? petsBreed;
  String? petsCity;
  File? petsImage;
  String? petsPicture;
  int? petsWeight;
  int? petsMicrochipNumber;
  String? petsAllergies;
  PetModel({
    this.id,
    this.petName,
    this.petsGender,
    this.petsBirthday,
    this.petsType,
    this.petsBreed,
    this.petsCity,
    this.petsImage,
    this.petsPicture,
    this.petsWeight,
    this.petsMicrochipNumber,
    this.petsAllergies,
  });

  PetModel copyWith({
    String? id,
    String? petName,
    String? petsGender,
    DateTime? petsBirthday,
    String? petsType,
    String? petsBreed,
    String? petsCity,
    File? petsImage,
    String? petsPicture,
    int? petsWeight,
    int? petsMicrochipNumber,
    String? petsAllergies,
  }) {
    return PetModel(
      id: id ?? this.id,
      petName: petName ?? this.petName,
      petsGender: petsGender ?? this.petsGender,
      petsBirthday: petsBirthday ?? this.petsBirthday,
      petsType: petsType ?? this.petsType,
      petsBreed: petsBreed ?? this.petsBreed,
      petsCity: petsCity ?? this.petsCity,
      petsImage: petsImage ?? this.petsImage,
      petsPicture: petsPicture ?? this.petsPicture,
      petsWeight: petsWeight ?? this.petsWeight,
      petsMicrochipNumber: petsMicrochipNumber ?? this.petsMicrochipNumber,
      petsAllergies: petsAllergies ?? this.petsAllergies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'petName': petName,
      'petsGender': petsGender,
      'petsBirthday': petsBirthday?.millisecondsSinceEpoch,
      'petsType': petsType,
      'petsBreed': petsBreed,
      'petsCity': petsCity,
      'petsPicture': petsPicture,
      'petsWeight': petsWeight,
      'petsMicrochipNumber': petsMicrochipNumber,
      'petsAllergies': petsAllergies,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'] != null ? map['id'] as String : null,
      petName: map['petName'] != null ? map['petName'] as String : null,
      petsGender:
          map['petsGender'] != null ? map['petsGender'] as String : null,
      petsBirthday: map['petsBirthday'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['petsBirthday'] as int)
          : null,
      petsType: map['petsType'] != null ? map['petsType'] as String : null,
      petsBreed: map['petsBreed'] != null ? map['petsBreed'] as String : null,
      petsCity: map['petsCity'] != null ? map['petsCity'] as String : null,
      petsPicture:
          map['petsPicture'] != null ? map['petsPicture'] as String : null,
      petsWeight: map['petsWeight'] != null ? map['petsWeight'] as int : null,
      petsMicrochipNumber: map['petsMicrochipNumber'] != null
          ? map['petsMicrochipNumber'] as int
          : null,
      petsAllergies:
          map['petsAllergies'] != null ? map['petsAllergies'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
