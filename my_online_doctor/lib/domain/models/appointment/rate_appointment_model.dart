//Package imports
import 'dart:convert';

RateAppointmentModel rateAppointmentModelFromJson(String str) => RateAppointmentModel.fromJson(json.decode(str));

String rateAppointmentModelToJson(RateAppointmentModel data) => json.encode(data.toJson());


class RateAppointmentModel{

  String id;
  int rating;

  RateAppointmentModel({
    required this.id,
    required this.rating,
  });

  factory RateAppointmentModel.fromJson(Map<String, dynamic> json) => RateAppointmentModel(
    id: json["id"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
  };
  
}