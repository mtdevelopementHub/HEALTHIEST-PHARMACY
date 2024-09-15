// To parse this JSON data, do
//
//     final getRiderModel = getRiderModelFromJson(jsonString);

import 'dart:convert';

GetRiderModel getRiderModelFromJson(String str) => GetRiderModel.fromJson(json.decode(str));

String getRiderModelToJson(GetRiderModel data) => json.encode(data.toJson());

class GetRiderModel {
    bool status;
    String message;
    List<Rider> riders;

    GetRiderModel({
        required this.status,
        required this.message,
        required this.riders,
    });

    factory GetRiderModel.fromJson(Map<String, dynamic> json) => GetRiderModel(
        status: json["status"],
        message: json["message"],
        riders: List<Rider>.from(json["riders"].map((x) => Rider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "riders": List<dynamic>.from(riders.map((x) => x.toJson())),
    };
}

class Rider {
    int id;
    String name;
    String contactNumber;
    String cnic;
    int pharmacyId;
    DateTime createdAt;
    DateTime updatedAt;

    Rider({
        required this.id,
        required this.name,
        required this.contactNumber,
        required this.cnic,
        required this.pharmacyId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        id: json["id"],
        name: json["name"],
        contactNumber: json["contact_number"],
        cnic: json["cnic"],
        pharmacyId: json["pharmacy_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact_number": contactNumber,
        "cnic": cnic,
        "pharmacy_id": pharmacyId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
