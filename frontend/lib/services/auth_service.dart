import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skill_swap/core/model/user_login_model.dart';

class AuthService {
  final String baseUrl = "https://9b6ad324d0cb.ngrok-free.app/api/v1/auth/login";

 Future<AxUserLoginModel?> login(String email, String password) async {
  final url = Uri.parse(baseUrl);

  print(" Sending POST to $url");
  print(" Body: { email: $email, password: $password }");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
  );

  print(" Status: ${response.statusCode}");
  print(" Body: ${response.body}");

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    if (json.containsKey("accessToken")) {
      return AxUserLoginModel.fromJson(json);
    } else {
      print("Response is missing required fields.");
      return null;
    }
  } else {
    print("Login failed with status ${response.statusCode}");
    return null;
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
