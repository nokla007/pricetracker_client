import 'package:flutter/material.dart';
import 'package:pricetracker_client/screens/producttile.dart';
import 'package:pricetracker_client/screens/searchpage.dart';
import 'package:pricetracker_client/services/productservice.dart';
import 'package:pricetracker_client/models/user.dart';
import 'package:pricetracker_client/screens/productpage.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../services/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  static const String id = 'homepage';
  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = ProductService(widget.user).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              context.read<Authentication>().signOut();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductTile(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}
