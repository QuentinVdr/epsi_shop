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
}
