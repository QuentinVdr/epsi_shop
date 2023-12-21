import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Panier Flutter Save',
          )),
          backgroundColor: Colors.lightBlue,
        ),
        body: EmptyCart());
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(children: [
        Row(children: [
          Text('Votre panier total est de'),
          Spacer(),
          Text(
            '0.00€',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
        Spacer(),
        Column(children: [
          Text('Votre panier est actuellement vide'),
          Icon(Icons.image)
        ]),
        Spacer()
      ]),
    );
  }
}
