//Package imports
import 'dart:convert';

// List<GetAppointmentModel> requestAppointmentModelFromJson(String str) => List<GetAppointmentModel>.from(json.decode(str).map((x) => GetAppointmentModel.fromJson(x)));

GetAppointmentModel getAppointmentModelFromJson(Map<String, dynamic> data) => GetAppointmentModel.fromJson(data);

// String requestAppointmentModelToJson(List<GetAppointmentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


///GetAppointmentModel: Model for get the list of Appointments

 
// class GetAppointmentValue {

//   List<GetAppointmentModel> value;

//   GetAppointmentValue({
//     required this.value,
//   });

//   factory GetAppointmentValue.fromJson(Map<String, dynamic> json) => GetAppointmentValue(
//     value: List<GetAppointmentModel>.from(json['value'].map((x) => GetAppointmentModel.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "value": value,
//   };



// }

class GetAppointmentModel {
  String id;
  DateTime? date;
  String description;
  int? duration;
  String status;
  String type;
  Patient patient;
  Doctor doctor;
  Specialty specialty;


  GetAppointmentModel({
    required this.id,
    required this.date,
    required this.description,
    required this.duration,
    required this.status,
    required this.type,
    required this.patient,
    required this.doctor,
    required this.specialty,

  });


  factory GetAppointmentModel.fromJson(Map<String, dynamic> json) => GetAppointmentModel(
    id: json['id'],
    date: json['date'] == null ? null : DateTime.parse(json['date']),
    description: json['description'],
    duration: json['duration'],
    status: json['status'],
    type: json['type'],
    patient: Patient.fromJson(json['patient']),
    doctor: Doctor.fromJson(json['doctor']),
    specialty: Specialty.fromJson(json['specialty']),
  );


  Map<String, dynamic> toJson() => {
    'id' : id,
    'date' : date!.toIso8601String(),
    'description' : description,
    'duration' : duration,
    'status' : status,
    'type' : type,
    'patient' : patient.toJson(),
    'doctor' : doctor.toJson(),
    'specialty' : specialty.toJson(),

  };

}


class Patient {
  String id;
  String firstName;
  String firstSurname;
  String gender;
  String status;

  Patient({
    required this.id,
    required this.firstName,
    required this.firstSurname,
    required this.gender,
    required this.status,
  });


  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'],
    firstName: json['firstName'],
    firstSurname: json['firstSurname'],
    gender: json['gender'],
    status: json['status'],
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'firstSurname': firstSurname,
    'gender': gender,
    'status': status,
  };

}


class Doctor {
  String id;
  String firstName;
  String firstSurname;
  String gender;
  String status;


  Doctor({
    required this.id,
    required this.firstName,
    required this.firstSurname,
    required this.gender,
    required this.status,
  });


  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'],
    firstName: json['firstName'],
    firstSurname: json['firstSurname'],
    gender: json['gender'],
    status: json['status'],
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'firstSurname': firstSurname,
    'gender': gender,
    'status': status,
  };


}





class Specialty{
  int id;
  String specialty;

  Specialty({
    required this.id,
    required this.specialty,
  });


  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
    id: json['id'], 
    specialty: json['specialty']
  );


  Map<String, dynamic> toJson() => {
    'id' : id,
    'specialty' : specialty
  };


}