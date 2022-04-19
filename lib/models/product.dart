// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    this.image,
    required this.title,
    required this.price,
    required this.url,
  });

  int id;
  String? image;
  String title;
  double price;
  String url;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        image: json["image"] ?? null,
        title: json["title"],
        price: json["price"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image ?? null,
        "title": title,
        "price": price,
        "url": url,
      };
}
