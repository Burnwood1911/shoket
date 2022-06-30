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
