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
