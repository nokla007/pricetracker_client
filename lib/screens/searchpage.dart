import 'package:flutter/material.dart';
import 'package:pricetracker_client/screens/producttile.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/user.dart';
import '../services/authentication.dart';
import '../services/productservice.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List<Product> products = [];

  final User user = User(id: 33, email: 'oke@email.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search for a product or Paste URL',
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String searchtext = _searchController.text;
              bool isUrl = Uri.tryParse(searchtext)?.hasAbsolutePath ?? false;
              if (isUrl) {
                print('url');
                Product product = await ProductService(
                        context.read<Authentication>().currentUser ?? user)
                    .fetchProduct(searchtext).timeout(Duration(seconds: 30));
                products = [product];
                print('got result');
              } else {
                print('not url');
                products = await ProductService(
                        context.read<Authentication>().currentUser ?? user)
                    .searchProduct(searchtext).timeout(Duration(seconds: 30));
                print('got result');
              }
              _searchController.clear();
              setState(() {});
            },
            icon: Icon(Icons.search),
          ),
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
