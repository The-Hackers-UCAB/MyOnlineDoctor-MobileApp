//Package imports
import 'dart:convert';

RequestAppointmentModel acceptAppointmentModelFromJson(String str) => RequestAppointmentModel.fromJson(json.decode(str));

String acceptAppointmentModelToJson(RequestAppointmentModel data) => json.encode(data.toJson());


class RequestAppointmentModel{

  String description;
  String type;
  String doctorId;
  String doctorSpecialty;


  RequestAppointmentModel({
    required this.doctorId,
    required this.doctorSpecialty,
    required this.description,
    required this.type,
  });

  factory RequestAppointmentModel.fromJson(Map<String, dynamic> json) => RequestAppointmentModel(
    doctorId: json['doctorId'],
    doctorSpecialty: json['doctorSpecialty'],
    description: json['description'],
    type: json['type'],
  
  );

  Map<String, dynamic> toJson() => {
    'doctorId': doctorId,
    'doctorSpecialty': doctorSpecialty,
    'description': description,
    'type': type,
  };
  
}