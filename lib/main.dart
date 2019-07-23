import 'package:flutter/material.dart';
import 'package:shopd_flutter/screens/product_detail_screen.dart';
import 'package:shopd_flutter/screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          ),
        ),
      ),
      // home: ProductsOverviewScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => ProductsOverviewScreen(),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
