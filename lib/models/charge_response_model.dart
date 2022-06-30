import 'dart:convert';

import 'customer_model.dart';
import 'data_model.dart';

ChargeResponse chargeResponseFromJson(String str) =>
    ChargeResponse.fromJson(json.decode(str));

String chargeResponseToJson(ChargeResponse data) => json.encode(data.toJson());

class ChargeResponse {
  ChargeResponse({
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

  factory ChargeResponse.fromJson(Map<String, dynamic> json) => ChargeResponse(
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
