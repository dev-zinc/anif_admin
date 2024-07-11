
import 'dart:convert';

import 'package:http/http.dart';

const String _uri = 'http://devport.tplinkdns.com:10000/api/v1/';

Future<dynamic> request(
    String uri
) async {
  final response = await get(
      Uri.parse(_uri + uri),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      }
  );
  final decodedBody = utf8.decode(response.bodyBytes);
  final decode = json.decode(decodedBody);
  return decode;
}


