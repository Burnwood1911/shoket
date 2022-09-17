library shoket;

import 'package:http/http.dart' as http;
import 'package:shoket/models/charge_response_model.dart';
import 'models/payment_model.dart';
import 'models/verify_response_model.dart';

class Shoket {
  Shoket({required this.apiKey});

  final String apiKey;

  final client = http.Client();

  Future<ChargeResponse?> charge(Payment payment) async {
    try {
      var response = await client.post(
        Uri.parse("https://api.shoket.co/v1/charge/"),
        body: paymentToJson(payment),
        headers: {
          'Authorization': 'Bearer ' + apiKey,
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      if (response.statusCode == 201) {
        ChargeResponse chargeResponse = chargeResponseFromJson(response.body);

        return chargeResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<VerifyResponse?> verify(String id) async {
    try {
      var response = await client.get(
        Uri.parse("https://api.shoket.co/v1/verify/" + id),
        headers: {
          'Authorization': 'Bearer ' + apiKey,
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        VerifyResponse verifyResponse = verifyResponseFromJson(response.body);

        return verifyResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
