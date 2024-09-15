// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) => OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) => json.encode(data.toJson());

class OrderHistoryModel {
    bool status;
    String message;
    List<Order> orders;

    OrderHistoryModel({
        required this.status,
        required this.message,
        required this.orders,
    });

    factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
        status: json["status"],
        message: json["message"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    };
}

class Order {
    int id;
    String orderNumber;
    String name;
    String email;
    String contactNo;
    int userId;
    int pharmacyId;
    int medicineId;
    int quantity;
    int price;
    String address;
    String status;
    String paymentMethod;
    String leadTime;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    String pharmacy;
    String medicine;

    Order({
        required this.id,
        required this.orderNumber,
        required this.name,
        required this.email,
        required this.contactNo,
        required this.userId,
        required this.pharmacyId,
        required this.medicineId,
        required this.quantity,
        required this.price,
        required this.address,
        required this.status,
        required this.paymentMethod,
        required this.leadTime,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.pharmacy,
        required this.medicine,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderNumber: json["order_number"],
        name: json["name"],
        email: json["email"],
        contactNo: json["contact_no"],
        userId: json["user_id"],
        pharmacyId: json["pharmacy_id"],
        medicineId: json["medicine_id"],
        quantity: json["quantity"],
        price: json["price"],
        address: json["address"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        leadTime: json["lead_time"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pharmacy: json["pharmacy"],
        medicine: json["medicine"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "name": name,
        "email": email,
        "contact_no": contactNo,
        "user_id": userId,
        "pharmacy_id": pharmacyId,
        "medicine_id": medicineId,
        "quantity": quantity,
        "price": price,
        "address": address,
        "status": status,
        "payment_method": paymentMethod,
        "lead_time": leadTime,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pharmacy": pharmacy,
        "medicine": medicine,
    };
}
