import 'package:flutter/cupertino.dart';

import 'article.dart';

// Cette classe implemente le design pattern Observer/Observable
// A chaque fois que le panier change, il faut notifier les widgets qui ecoutent
class Cart with ChangeNotifier {
  final _listArticles = <Article>[];

  List<Article> get listArticles => _listArticles;

  void add(Article article) {
    _listArticles.add(article);
    notifyListeners();
  }

  void remove(Article article) {
    _listArticles.remove(article);
    notifyListeners();
  }

  void removeAll() {
    _listArticles.clear();
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    for (Article article in _listArticles) {
      total += article.prix;
    }
    return total;
  }

  String getTotalEnEuros() {
    return '${(getTotal() / 100).toStringAsFixed(2)}€';
  }

  String getTVAEnEuros() {
    return '${(getTotal() * 0.2 / 100).toStringAsFixed(2)}€';
  }

  double getTotalTVA() {
    return getTotal() * 1.2;
  }

  String getTotalTVAEnEuros() {
    return '${(getTotalTVA() / 100).toStringAsFixed(2)}€';
  }
}
