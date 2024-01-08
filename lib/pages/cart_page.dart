import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/article.dart';
import '../bo/cart.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final List<Article> listArticles = <Article>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Panier Flutter Save',
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return cart.listArticles.isEmpty ? const EmptyCart() : ListCart(cart);
        },
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
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

class ListCart extends StatelessWidget {
  const ListCart(this.cart, {super.key});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(children: [
            Text('Votre panier total est de'),
            Spacer(),
            Text(
              '${cart.getTotalEnEuros()}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.listArticles.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            leading: Image.network(
                                cart.listArticles[index].image,
                                width: 60),
                            title: Text(cart.listArticles[index].nom),
                            subtitle: Text(
                              cart.listArticles[index].getPrixEnEuros(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => context
                                  .read<Cart>()
                                  .remove(cart.listArticles[index]),
                            )));
                  })),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => context.read<Cart>().removeAll(),
              child: const Text('Vider le panier'))
        ]));
  }
}
