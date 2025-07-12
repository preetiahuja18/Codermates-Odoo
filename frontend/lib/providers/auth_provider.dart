import 'package:flutter/material.dart';
import 'package:skill_swap/core/model/user_login_model.dart';
import 'package:skill_swap/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  AxUserLoginModel? currentUser;

  Future<bool> login(String email, String password) async {
    final user = await _authService.login(email, password);
    if (user != null) {
      currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String email, String password) async {
    return await _authService.register(username, email, password);
  }
}
