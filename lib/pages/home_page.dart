import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final listArticle = <Article>[
    Article(
        nom: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
        image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        description: 'Description 1',
        prix: 10995,
        categorie: 'Sac'),
    Article(
        nom: 'Mens Casual Premium Slim Fit T-Shirts',
        image:
            'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
        description: 'Description 2',
        prix: 2230,
        categorie: 'TShirt')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Text(
              'E-Commerce',
            ),
            Spacer(),
            Badge(
              offset: Offset(-5, 5),
              label: Text(
                  "${context.watch<Cart>().listArticles.length > 99 ? '+99' : context.watch<Cart>().listArticles.length}"),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => context.goNamed('cart'),
              ),
            ),
          ]),
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: listArticle.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      leading:
                          Image.network(listArticle[index].image, width: 60),
                      title: Text(listArticle[index].nom),
                      subtitle: Text(
                        listArticle[index].getPrixEnEuros(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          context.read<Cart>().add(listArticle[index]);
                        },
                        child: Text('Ajouter'),
                      )),
                );
              },
            )));
  }
}
