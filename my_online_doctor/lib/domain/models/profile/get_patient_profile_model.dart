//Package imports
import 'dart:convert';

GetPatientProfileModel getPatientProfileModelFromJson(Map<String,dynamic> data) => GetPatientProfileModel.fromJson(data);

String getPatientProfileModelToJson(GetPatientProfileModel data) => json.encode(data.toJson());


class GetPatientProfileModel{

  String id;
  String firstName;
  String middleName;
  String firstSurname;
  String secondSurname;
  String allergies;
  String background;
  String birthdate;
  String height;
  String phoneNumber;
  String status;
  String weight;
  String surgeries;
  String gender;


  GetPatientProfileModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.firstSurname,
    required this.secondSurname,
    required this.allergies,
    required this.background,
    required this.birthdate,
    required this.height,
    required this.phoneNumber,
    required this.status,
    required this.weight,
    required this.surgeries,
    required this.gender,
  });


  factory GetPatientProfileModel.fromJson(Map<String, dynamic> json) => GetPatientProfileModel(
    id: json['id'],
    firstName: json['firstName'],
    middleName: json['middleName'],
    firstSurname: json['firstSurname'],
    secondSurname: json['secondSurname'],
    allergies: json['allergies'],
    background: json['background'],
    birthdate: json['birthdate'],
    height: json['height'],
    phoneNumber: json['phoneNumber'],
    status: json['status'],
    weight: json['weight'],
    surgeries: json['surgeries'],
    gender: json['gender'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'middleName' : middleName,
    'firstSurname': firstSurname,
    'secondSurname': secondSurname,
    'allergies': allergies,
    'background': background,
    'birthdate': birthdate,
    'height': height,
    'phoneNumber': phoneNumber,
    'status': status,
    'weight' : weight,
    'surgeries': surgeries,
    'gender': gender,    
  };

}
