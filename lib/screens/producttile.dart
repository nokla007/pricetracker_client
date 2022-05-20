import 'package:flutter/material.dart';
import 'package:pricetracker_client/models/product.dart';
import 'package:pricetracker_client/screens/productpage.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);
  final Product product;
  final errorImage = 'https://www.megapc.tn/assets/images/image-not-found.png';

  @override
  Widget build(BuildContext context) {
    return Card(
      // child: ProductListTile(product: product),
      child: GestureDetector(
        onTap: () {
          print(product.title);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(product: product)),
          );
        },
        child: Container(
          width: double.infinity,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Price: ' + product.price.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                Text(
                  product.url,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
          MaterialPageRoute(
              builder: (context) => ProductPage(product: product)),
        );
      },
    );
  }
}
