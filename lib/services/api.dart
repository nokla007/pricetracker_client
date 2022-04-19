import 'dart:convert';

import '../models/product.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class API {
  static const String host = "http://127.0.0.1";
  static const String port = "8000";

  static const String baseUrl = host + ":" + port;
  static const String userUrl = "$baseUrl/users";
  static const String signinUrl = "$userUrl/login/";
  static const String signupUrl = "$userUrl/create/";
  static const String searchUrl = "$baseUrl/search/";
  static const String productUrl = "$baseUrl/products/";
  static const String fetchUrl = "$productUrl/fetch/";
  static const String favoritesUrl = "$baseUrl/favorites/";
  static const String addFavoritesUrl = "$favoritesUrl/add/";
  static const String removeFavoritesUrl = "$favoritesUrl/remove/";

  Future<Map> signIn(String email, String password) async {
    var url = Uri.parse(signinUrl);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      throw Exception("Invalid email or password");
    } else {
      throw Exception('Error');
    }
  }

  Future<Map> signUp(String email, String password) async {
    var url = Uri.parse(signupUrl);
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 302) {
      throw Exception("Invalid email or password");
    } else {
      throw Exception('Error');
    }
  }

  Future<List<Map<String, dynamic>>> search(String query) async {
    var url = Uri.parse(searchUrl + query);
    var response = await http.post(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception("No results found");
    } else {
      throw Exception('Error');
    }
  }

  Future<Map<String, dynamic>> fetch(String product_url) async {
    var url = Uri.parse(fetchUrl);
    var response = await http.post(url, body: {
      "url": product_url,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception("No products found");
    } else {
      throw Exception('Error');
    }
  }

  Future<Map<String, dynamic>> getProduct(int id) {
    var url = Uri.parse(productUrl + id.toString());
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception("No products found");
      } else {
        throw Exception('Error');
      }
    });
  }

  Future<Map<String, dynamic>> addProduct(Map<String, dynamic> product) {
    var url = Uri.parse(productUrl);
    return http.post(url, body: product).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        throw Exception("Product Exists");
      } else {
        throw Exception('Error');
      }
    });
  }

  Future<Map<String, dynamic>> updateProduct(int productId) {
    var url = Uri.parse(productUrl + productId.toString());
    return http.put(url).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        throw Exception("Product Exists");
      } else {
        throw Exception('Error');
      }
    });
  }

  Future<List<Map<String, dynamic>>> getFavorites(int userID) {
    var url = Uri.parse(favoritesUrl + userID.toString());
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception("Unauthorized");
      } else {
        throw Exception('Error');
      }
    });
  }

  Future<Map<String, dynamic>> addFavorite(int userID, int productID) {
    var url = Uri.parse(addFavoritesUrl);
    return http.post(url, body: {
      "user_id": userID,
      "product_id": productID,
    }).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        throw Exception("Unauthorized");
      } else {
        throw Exception('Error');
      }
    });
  }

  Future<Map<String, dynamic>> removeFavorite(int userID, int productID) {
    var url = Uri.parse(removeFavoritesUrl);
    return http.post(url, body: {
      "user_id": userID,
      "product_id": productID,
    }).then((response) {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        throw Exception("Unauthorized");
      } else {
        throw Exception('Error');
      }
    });
  }
}
