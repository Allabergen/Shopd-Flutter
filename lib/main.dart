import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopd_flutter/providers/cart.dart';
import 'package:shopd_flutter/providers/orders.dart';
import 'package:shopd_flutter/screens/cart_screen.dart';
import 'package:shopd_flutter/screens/orders_screen.dart';
import 'package:shopd_flutter/screens/product_detail_screen.dart';
import 'package:shopd_flutter/screens/products_overview_screen.dart';

import 'providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopd',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF2F596D),
          accentColor: Color(0xFFB13840),
          primaryColorLight: Color(0xFF5E99AE),
          primaryColorDark: Color(0xFF141618),
          scaffoldBackgroundColor: Colors.grey[100],
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            body1: TextStyle(
              color: Colors.black87,
              fontFamily: 'Montserrat',
            ),
            body2: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
              fontSize: 14.0,
            ),
          ),
        ),
        // home: ProductsOverviewScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
