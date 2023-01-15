import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './baseUrl.dart';

createHttpRequest(String endpoint, String requestType, dynamic data,
    BuildContext context) async {
  try {
    final Map<String, String> configHeaders = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    var url = Uri.parse(baseUrl + endpoint);
    var response;
    switch (requestType.toUpperCase()) {
      case 'POST':
        if (endpoint == 'api/Account/login') {
          response = await http.post(url,
              headers: configHeaders, body: convert.jsonEncode(data));
        } else {
          response = await http.post(url,
              headers: configHeaders, body: convert.jsonEncode(data));
        }

        break;
      case 'GET':
        response = await http.get(url, headers: configHeaders);

        break;
      case 'DELETE':
        response = await http.delete(url,
            headers: configHeaders, body: convert.jsonEncode(data));

        break;
      case 'UPDATE':
        response = await http.patch(url,
            headers: configHeaders, body: convert.jsonEncode(data));
        break;
    }

    return response;
  } catch (err) {
    print("Uncaught error: $err");
  }
}
