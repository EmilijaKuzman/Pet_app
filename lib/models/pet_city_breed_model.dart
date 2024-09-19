import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PetCityBreedModel {
  List<String> listCities;
  List<String> listBreed;
  PetCityBreedModel({
    required this.listCities,
    required this.listBreed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listCities': listCities,
      'listBreed': listBreed,
    };
  }

  factory PetCityBreedModel.fromMap(Map<String, dynamic> map) {
    return PetCityBreedModel(
      listCities: List<String>.from((map['city'] as List)),
      listBreed: List<String>.from((map['breed'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PetCityBreedModel.fromJson(String source) =>
      PetCityBreedModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
