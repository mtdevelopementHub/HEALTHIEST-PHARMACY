// To parse this JSON data, do
//
//     final getUpdatePharmacy = getUpdatePharmacyFromJson(jsonString);

import 'dart:convert';

GetUpdatePharmacy getUpdatePharmacyFromJson(String str) => GetUpdatePharmacy.fromJson(json.decode(str));

String getUpdatePharmacyToJson(GetUpdatePharmacy data) => json.encode(data.toJson());

class GetUpdatePharmacy {
    bool status;
    String message;
    Pharmacy pharmacy;

    GetUpdatePharmacy({
        required this.status,
        required this.message,
        required this.pharmacy,
    });

    factory GetUpdatePharmacy.fromJson(Map<String, dynamic> json) => GetUpdatePharmacy(
        status: json["status"],
        message: json["message"],
        pharmacy: Pharmacy.fromJson(json["pharmacy"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "pharmacy": pharmacy.toJson(),
    };
}

class Pharmacy {
    int id;
    String name;
    String contactNumber;
    String location;
    String latitude;
    String longitude;
    int userId;
    String? image;
    DateTime createdAt;
    DateTime updatedAt;

    Pharmacy({
        required this.id,
        required this.name,
        required this.contactNumber,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.userId,
         this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        id: json["id"],
        name: json["name"],
        contactNumber: json["contact_number"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        userId: json["user_id"],
         image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact_number": contactNumber,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "user_id": userId,
         "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
