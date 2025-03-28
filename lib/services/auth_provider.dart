import 'package:flutter/material.dart';
import 'package:product_detail_application/app/routes/app_routes.dart';
import 'package:product_detail_application/utils/constants.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(
      String username, String password, BuildContext context) async {
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username and password cannot be empty')),
      );
      return;
    }

    if (username == "admin" && password == "admin@123") {
      _isAuthenticated = true;
      notifyListeners();
      Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Invalid credentials'),
          backgroundColor: kError,
        ),
      );
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
