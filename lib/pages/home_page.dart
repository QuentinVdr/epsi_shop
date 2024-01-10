import 'dart:convert';

import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            const Text(
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
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: fetchListProducts(),
                  builder: (context, snapshot) =>
                      switch (snapshot.connectionState) {
                        ConnectionState.done when snapshot.hasData =>
                          ListArticles(
                              listArticle: snapshot.data as List<Article>),
                        ConnectionState.waiting =>
                          const CircularProgressIndicator(),
                        _ => const Icon(Icons.error)
                      })),
        ));
  }

  Future<List<Article>> fetchListProducts() async {
    String uri = 'https://fakestoreapi.com/products';
    Response resListArt = await get(Uri.parse(uri));
    // Si la requête s'est bien passer et que le contenu n'est pas vide
    if (resListArt.statusCode == 200 && resListArt.body.isNotEmpty) {
      final resListMap = jsonDecode(resListArt.body) as List<dynamic>;
      return resListMap
          .map((map) => Article.fromMap(map as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Requête invalide');
    }
  }
}

class ListArticles extends StatelessWidget {
  const ListArticles({
    super.key,
    required this.listArticle,
  });

  final List<Article> listArticle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listArticle.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                context.goNamed('detail', extra: listArticle[index]);
              },
              leading: Image.network(listArticle[index].image, width: 60),
              title: Text(listArticle[index].nom,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                listArticle[index].getPrixEnEuros(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: TextButton(
                onPressed: () {
                  context.read<Cart>().add(listArticle[index]);
                },
                child: const Text('Ajouter'),
              )),
        );
      },
    );
  }
}
