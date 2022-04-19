import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pricetracker_client/services/api.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class Authentication extends ChangeNotifier {
  static User? _currentUser;
  get currentUser => _currentUser;

  bool haveAccount = true;

  final API api = API();

  Future<void> signIn(String email, String password) async {
    // _currentUser = User.fromJson(userjson);

    var url = Uri.parse(API.signinUrl);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      User user = User.fromJson(json.decode(response.body));
      if (user != null) {
        _currentUser = user;
        notifyListeners();
      }
    } else if (response.statusCode == 400) {
      throw Exception("Invalid email or password");
    } else {
      throw Exception('Error');
    }
  }

  Future<void> signUp(String email, String password) async {
    // _currentUser = User.fromJson(userjson);
    var url = Uri.parse(API.signupUrl);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      User user = User.fromJson(json.decode(response.body));
      if (user != null) {
        _currentUser = user;
        haveAccount = true;
        notifyListeners();
      }
    } else if (response.statusCode == 400) {
      throw Exception("Invalid email or password");
    } else {
      throw Exception('Error');
    }
    haveAccount = true;
    notifyListeners();
  }

  Future<void> signOut() async {
    _currentUser = null;
    notifyListeners();
  }

  void toggleHaveAccount() {
    haveAccount = !haveAccount;
    notifyListeners();
  }
}

var userjson = {"id": 6, "email": "kaask@sasa.com"};
