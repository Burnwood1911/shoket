import 'package:flutter/material.dart';
import 'package:shoket/models/charge_response_model.dart';
import 'package:shoket/models/payment_model.dart';
import 'package:shoket/shoket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoket Demo',
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final shoket = Shoket(apiKey: "sk_hwNLWTeLdwPbok");

  final name = TextEditingController();
  final email = TextEditingController();
  final number = TextEditingController();
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(label: Text("Name")),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(label: Text("Email")),
            ),
            TextField(
              controller: number,
              decoration: const InputDecoration(
                  label: Text("Number"), hintText: "07xxxxxxxx"),
            ),
            TextField(
              controller: amount,
              decoration: const InputDecoration(label: Text("Amount")),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  ChargeResponse? result = await shoket.charge(Payment(
                      amount: amount.text,
                      customerName: name.text,
                      email: email.text,
                      numberUsed: number.text,
                      channel: "halotel"));

                  if (result != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Success")));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Failed")));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Pay"),
                ))
          ],
        ),
      ),
    );
  }
}
