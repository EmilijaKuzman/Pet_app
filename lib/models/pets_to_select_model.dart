import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PetsToSelectModel {
  String id;
  String petsPicture;
  String petsSort;
  PetsToSelectModel({
    required this.id,
    required this.petsPicture,
    required this.petsSort,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'petsPicture': petsPicture,
      'petsSort': petsSort,
    };
  }

  factory PetsToSelectModel.fromMap(Map<String, dynamic> map) {
    return PetsToSelectModel(
      id: map['id'] as String,
      petsPicture: map['petsPicture'] as String,
      petsSort: map['petsSort'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetsToSelectModel.fromJson(String source) =>
      PetsToSelectModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
