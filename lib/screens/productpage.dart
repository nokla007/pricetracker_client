// import 'package:flutter/material.dart';
// import 'package:pricetracker_client/models/product.dart';

// product details screen

import 'package:flutter/material.dart';
import 'package:pricetracker_client/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final errorImage = 'https://www.megapc.tn/assets/images/image-not-found.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: 400,
              child: Image.network(
                widget.product.image ?? errorImage,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.product.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Price: ' + widget.product.price.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Link: " + widget.product.url,
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                launch(widget.product.url);
              },
              child: Text(
                "Go to link",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
