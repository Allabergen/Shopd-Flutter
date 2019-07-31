import 'package:flutter/material.dart';
import 'package:shopd_flutter/screens/orders_screen.dart';
import 'package:shopd_flutter/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Shopd'),
            automaticallyImplyLeading: false,
          ),
          SizedBox(
            height: 8.0,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(
              'Shop',
              style: Theme.of(context).textTheme.body1,
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text(
              'Orders',
              style: Theme.of(context).textTheme.body1,
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrdersScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(
              'Manage Products',
              style: Theme.of(context).textTheme.body1,
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
