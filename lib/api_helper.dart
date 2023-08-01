import 'dart:convert';

import 'package:api_calling_in_flutter/models/Album.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<List<Album>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final List body = json.decode(response.body);
      return body.map((e) => Album.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
