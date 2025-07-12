import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://jsonplaceholder.typicode.com"; // Change later

  Future<bool> login(String email, String password) async {
    final response = await http.get(Uri.parse('$baseUrl/users?email=$email'));
    if (response.statusCode == 200) {
      final List users = jsonDecode(response.body);
      return users.isNotEmpty;
    } else {
      throw Exception("Login failed");
    }
  }

  Future<bool> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: jsonEncode({"username": username, "email": email, "password": password}),
      headers: {"Content-Type": "application/json"},
    );
    return response.statusCode == 201;
  }
}
