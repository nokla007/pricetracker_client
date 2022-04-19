import 'package:flutter/material.dart';
import 'package:pricetracker_client/models/product.dart';
import 'package:pricetracker_client/screens/productpage.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);
  final Product product;
  final errorImage = 'https://www.megapc.tn/assets/images/image-not-found.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: ListTile(
          minVerticalPadding: 20,
          isThreeLine: true,
          style: ListTileStyle.list,
          title: Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: Text(
            'Price:  ' + product.price.toString(),
            style: TextStyle(
              color: Colors.blueGrey[900],
            ),
          ),
          // leading: Container(
          //   height: 50,
          //   width: 50,
          //   child: Image.network(
          //     product.image ?? errorImage,
          //     fit: BoxFit.scaleDown,
          //   ),
          // ),
          onTap: () {
            print(product.title);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductPage(product: product)),
            );
          },
        ),
      ),
    );
  }
}
