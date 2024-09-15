// To parse this JSON data, do
//
//     final viewMedicineModel = viewMedicineModelFromJson(jsonString);

import 'dart:convert';

ViewMedicineModel viewMedicineModelFromJson(String str) => ViewMedicineModel.fromJson(json.decode(str));

String viewMedicineModelToJson(ViewMedicineModel data) => json.encode(data.toJson());

class ViewMedicineModel {
    bool status;
    String message;
    Medicine5 medicine;
    String pharmacy;
    String location;

    ViewMedicineModel({
        required this.status,
        required this.message,
        required this.medicine,
        required this.pharmacy,
        required this.location,
    });

    factory ViewMedicineModel.fromJson(Map<String, dynamic> json) => ViewMedicineModel(
        status: json["status"],
        message: json["message"],
        medicine: Medicine5.fromJson(json["medicine"]),
        pharmacy: json["pharmacy"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "medicine": medicine.toJson(),
        "pharmacy": pharmacy,
        "location": location,
    };
}

class Medicine5 {
    int id;
    String name;
    String dosage;
    int price;
    int quantity;
    int status;
    String formula;
    String image;
    int categoryId;
    int pharmacyId;
    int isVerified;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    Pharmacy pharmacy;

    Medicine5({
        required this.id,
        required this.name,
        required this.dosage,
        required this.price,
        required this.quantity,
        required this.status,
        required this.formula,
        required this.image,
        required this.categoryId,
        required this.pharmacyId,
        required this.isVerified,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.pharmacy,
    });

    factory Medicine5.fromJson(Map<String, dynamic> json) => Medicine5(
        id: json["id"],
        name: json["name"],
        dosage: json["dosage"],
        price: json["price"],
        quantity: json["quantity"],
        status: json["status"],
        formula: json["formula"],
        image: json["image"],
        categoryId: json["category_id"],
        pharmacyId: json["pharmacy_id"],
        isVerified: json["is_verified"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pharmacy: Pharmacy.fromJson(json["pharmacy"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dosage": dosage,
        "price": price,
        "quantity": quantity,
        "status": status,
        "formula": formula,
        "image": image,
        "category_id": categoryId,
        "pharmacy_id": pharmacyId,
        "is_verified": isVerified,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
