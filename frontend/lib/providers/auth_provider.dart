import 'package:flutter/material.dart';
import 'package:skill_swap/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<bool> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  Future<bool> register(String username, String email, String password) async {
    return await _authService.register(username, email, password);
  }
}
