import 'package:flutter/material.dart';
import 'package:shopd_flutter/models/product.dart';
import 'package:shopd_flutter/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopd',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ProductsGrid(),
    );
  }
}
