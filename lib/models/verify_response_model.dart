import 'dart:convert';

import 'customer_model.dart';
import 'data_model.dart';

VerifyResponse verifyResponseFromJson(String str) =>
    VerifyResponse.fromJson(json.decode(str));

String verifyResponseToJson(VerifyResponse data) => json.encode(data.toJson());

class VerifyResponse {
  VerifyResponse({
    this.status,
    this.customer,
    this.data,
    this.message,
    this.reference,
  });

  String? status;
  Customer? customer;
  Data? data;
  String? message;
  String? reference;

  factory VerifyResponse.fromJson(Map<String, dynamic> json) => VerifyResponse(
        status: json["Status"],
        customer: Customer.fromJson(json["customer"]),
        data: Data.fromJson(json["data"]),
        message: json["message"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "customer": customer!.toJson(),
        "data": data!.toJson(),
        "message": message,
        "reference": reference,
      };
}
