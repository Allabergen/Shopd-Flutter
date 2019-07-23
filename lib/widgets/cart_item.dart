import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopd_flutter/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String pId;
  final String title;
  final double price;
  final int quantity;

  CartItem(this.id, this.pId, this.title, this.price, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 36.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(pId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                  child: Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('x $quantity'),
          ),
        ),
      ),
    );
  }
}
