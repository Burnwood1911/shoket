import 'dart:convert';

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

class Customer {
  Customer({
    this.customerName,
    this.email,
    this.id,
  });

  String? customerName;
  String? email;
  int? id;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerName: json["customer_name"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "customer_name": customerName,
        "email": email,
        "id": id,
      };
}

class Data {
  Data({
    this.amount,
    this.channel,
    this.currency,
    this.numberUsed,
    this.status,
    this.transactionDate,
  });

  int? amount;
  String? channel;
  String? currency;
  String? numberUsed;
  String? status;
  String? transactionDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        amount: json["amount"],
        channel: json["channel"],
        currency: json["currency"],
        numberUsed: json["number_used"],
        status: json["status"],
        transactionDate: json["transaction_date"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "channel": channel,
        "currency": currency,
        "number_used": numberUsed,
        "status": status,
        "transaction_date": transactionDate,
      };
}
