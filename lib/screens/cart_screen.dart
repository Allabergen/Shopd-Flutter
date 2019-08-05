import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopd_flutter/providers/cart.dart' show Cart;
import 'package:shopd_flutter/providers/orders.dart';
import 'package:shopd_flutter/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.body2,
                    ),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  OderButton(cart: cart),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => CartItem(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].title,
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].quantity),
            ),
          )
        ],
      ),
    );
  }
}

class OderButton extends StatefulWidget {
  const OderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OderButtonState createState() => _OderButtonState();
}

class _OderButtonState extends State<OderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _isLoading ? CircularProgressIndicator() : Text('Order Now'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
    );
  }
}
