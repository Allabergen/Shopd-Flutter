import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopd_flutter/providers/orders.dart';
import 'package:shopd_flutter/widgets/app_drawer.dart';
import 'package:shopd_flutter/widgets/order_item.dart' as prefix0;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => prefix0.OrderItem(
          orderData.orders[i],
        ),
      ),
    );
  }
}
