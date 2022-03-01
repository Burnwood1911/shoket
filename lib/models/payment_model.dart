import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    required this.amount,
    required this.customerName,
    required this.email,
    required this.numberUsed,
    required this.channel,
  });

  String amount;
  String customerName;
  String email;
  String numberUsed;
  String channel;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json["amount"],
        customerName: json["customer_name"],
        email: json["email"],
        numberUsed: json["number_used"],
        channel: json["channel"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "customer_name": customerName,
        "email": email,
        "number_used": numberUsed,
        "channel": channel,
      };
}
