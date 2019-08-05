import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopd_flutter/providers/orders.dart';
import 'package:shopd_flutter/widgets/app_drawer.dart';
import 'package:shopd_flutter/widgets/order_item.dart' as prefix0;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error occurred'),
              );
            } else {
              return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                        itemCount: orderData.orders.length,
                        itemBuilder: (ctx, i) => prefix0.OrderItem(
                          orderData.orders[i],
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}
