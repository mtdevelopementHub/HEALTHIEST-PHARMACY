import 'dart:convert';

NearByModel nearByModelFromJson(String str) =>
    NearByModel.fromJson(json.decode(str));

String nearByModelToJson(NearByModel data) => json.encode(data.toJson());

class NearByModel {
  bool status;
  String message;
  List<Medicine2> medicines;

  NearByModel({
    required this.status,
    required this.message,
    required this.medicines,
  });

  factory NearByModel.fromJson(Map<String, dynamic> json) => NearByModel(
        status: json["status"],
        message: json["message"],
        medicines: List<Medicine2>.from(
            json["medicines"].map((x) => Medicine2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "medicines": List<dynamic>.from(medicines.map((x) => x.toJson())),
      };
}

class Medicine2 {
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
  DateTime createdAt;
  DateTime updatedAt;

  Medicine2({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory Medicine2.fromJson(Map<String, dynamic> json) => Medicine2(
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
