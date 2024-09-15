// To parse this JSON data, do
//
//     final presciptionModel = presciptionModelFromJson(jsonString);

import 'dart:convert';

PresciptionModel presciptionModelFromJson(String str) =>
    PresciptionModel.fromJson(json.decode(str));

String presciptionModelToJson(PresciptionModel data) =>
    json.encode(data.toJson());

class PresciptionModel {
  bool status;
  String message;
  List<Prescription> prescriptions;

  PresciptionModel({
    required this.status,
    required this.message,
    required this.prescriptions,
  });

  factory PresciptionModel.fromJson(Map<String, dynamic> json) =>
      PresciptionModel(
        status: json["status"],
        message: json["message"],
        prescriptions: List<Prescription>.from(
            json["prescriptions"].map((x) => Prescription.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "prescriptions":
            List<dynamic>.from(prescriptions.map((x) => x.toJson())),
      };
}

class Prescription {
  int id;
  String image;
  int status;
  int medicineId;
  DateTime createdAt;
  DateTime updatedAt;

  Prescription({
    required this.id,
    required this.image,
    required this.status,
    required this.medicineId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        id: json["id"],
        image: json["image"],
        status: json["status"],
        medicineId: json["medicine_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "status": status,
        "medicine_id": medicineId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
