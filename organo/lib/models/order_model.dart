import 'package:flutter/material.dart';

class OrderModel {
  late int id;
  late int userId;
  int? transactionId;
  double? orderAmount;
  String? orderStatus;
  String? paymentStatus;
  String? createdAt;

  OrderModel({
    required this.id,
    required this.userId,
    this.transactionId,
    this.orderAmount,
    this.paymentStatus,
    this.orderStatus,
    this.createdAt,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionId = json['transaction_id'];
    orderAmount = json['order_amount'].toDouble();
    paymentStatus = json['payment_status'] ?? "pending";
    orderStatus = json['order_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_amount'] = this.orderAmount;
    data['transaction_id'] = this.transactionId;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
