// To parse this JSON data, do
//
//     final getPharmacy = getPharmacyFromJson(jsonString);

import 'dart:convert';

GetPharmacy getPharmacyFromJson(String str) => GetPharmacy.fromJson(json.decode(str));

String getPharmacyToJson(GetPharmacy data) => json.encode(data.toJson());

class GetPharmacy {
    bool status;
    String message;
    List<Pharmacy> pharmacies;

    GetPharmacy({
        required this.status,
        required this.message,
        required this.pharmacies,
    });

    factory GetPharmacy.fromJson(Map<String, dynamic> json) => GetPharmacy(
        status: json["status"],
        message: json["message"],
        pharmacies: List<Pharmacy>.from(json["pharmacies"].map((x) => Pharmacy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "pharmacies": List<dynamic>.from(pharmacies.map((x) => x.toJson())),
    };
}

class Pharmacy {
    int? id;
    String? name;
    String? contactNumber;
    String? location;
    String? latitude;
    String? longitude;
    int? userId;
    String? image;
    DateTime createdAt;
    DateTime updatedAt;

    Pharmacy({
         this.id,
         this.name,
         this.contactNumber,
         this.location,
         this.latitude,
         this.longitude,
         this.userId,
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
