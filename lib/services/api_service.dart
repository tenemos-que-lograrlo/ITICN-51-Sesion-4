import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=15&nat=us,es,mx"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => User.fromJson(json)).toList();
    } else {
      debugPrint("Error HTTP ${response.statusCode}");
      throw Exception("Error HTTP ${response.statusCode}");
    }
  }
}
