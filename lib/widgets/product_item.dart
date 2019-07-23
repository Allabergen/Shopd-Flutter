import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopd_flutter/providers/product.dart';
import 'package:shopd_flutter/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: p.id,
            );
          },
          child: Image.network(
            p.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (ctx, p, child) => IconButton(
              icon: Icon(p.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                p.toggleFavoriteStatus();
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          title: Text(
            p.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.body2,
          ),
        ),
      ),
    );
  }
}
