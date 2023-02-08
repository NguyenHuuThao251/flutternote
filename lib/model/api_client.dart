import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  static Future<List<String>> getCurrencies() async {
    var currencyURL = Uri.https("currency-exchange.p.rapidapi.com", "/listquotes");
    final res = await http.get(currencyURL, headers: {
      "x-rapidapi-key": "eeea5cd2d2msh21a7837efffc7a8p1a5317jsnb54b689dc1a3",
      "x-rapidapi-host": "currency-exchange.p.rapidapi.com"
    });
    if(res.statusCode == 200) {
      List<String> temp = (jsonDecode(res.body) as List<dynamic>).cast<String>();
      return temp;
    } else {
      throw Exception('Failed to connect to API');
    }
  }

  static Future<double> getRate(String from, String to) async {
    var currencyURL = Uri.https("currency-exchange.p.rapidapi.com", "/exchange",
        {"from": from, "to": to, "q": "1"});
    final res = await http.get(currencyURL, headers: {
      "x-rapidapi-key": "eeea5cd2d2msh21a7837efffc7a8p1a5317jsnb54b689dc1a3",
      "x-rapidapi-host": "currency-exchange.p.rapidapi.com"
    });
    if(res.statusCode == 200) {
      double temp = (jsonDecode(res.body) as dynamic).cast<double>();
      return temp;
    } else {
      throw Exception('Failed to connect to API');
    }
  }
}