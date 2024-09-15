// To parse this JSON data, do
//
//     final getMedicineModel = getMedicineModelFromJson(jsonString);

import 'dart:convert';

GetMedicineModel getMedicineModelFromJson(String str) => GetMedicineModel.fromJson(json.decode(str));

String getMedicineModelToJson(GetMedicineModel data) => json.encode(data.toJson());

class GetMedicineModel {
    bool status;
    String message;
    List<Medicine> medicines;

    GetMedicineModel({
        required this.status,
        required this.message,
        required this.medicines,
    });

    factory GetMedicineModel.fromJson(Map<String, dynamic> json) => GetMedicineModel(
        status: json["status"],
        message: json["message"],
        medicines: List<Medicine>.from(json["medicines"].map((x) => Medicine.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "medicines": List<dynamic>.from(medicines.map((x) => x.toJson())),
    };
}

class Medicine {
    int id;
    String name;
    String dosage;
    int price;
    int quantity;
    int status;
    String formula;
    String? image;
    int categoryId;
    int pharmacyId;
    int isVerified;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    Medicine({
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
    });

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
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
    };
}


