import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String idStudent;
  final String name;
  final String yearStudent;
  final String divition;
  final String teacher;
  final String urlProfile;
  final String typeuser;
  UserModel({
    required this.idStudent,
    required this.name,
    required this.yearStudent,
    required this.divition,
    required this.teacher,
    required this.urlProfile,
    required this.typeuser,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idStudent': idStudent,
      'name': name,
      'yearStudent': yearStudent,
      'divition': divition,
      'teacher': teacher,
      'urlProfile': urlProfile,
      'typeuser': typeuser,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      idStudent: (map['idStudent'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      yearStudent: (map['yearStudent'] ?? '') as String,
      divition: (map['divition'] ?? '') as String,
      teacher: (map['teacher'] ?? '') as String,
      urlProfile: (map['urlProfile'] ?? '') as String,
      typeuser: (map['typeuser'] ?? '') as String,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
