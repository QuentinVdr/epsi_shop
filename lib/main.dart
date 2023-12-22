import 'package:epsi_shop/app.dart';
import 'package:epsi_shop/bo/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // On fournit une instance de Cart à toute l'application
  runApp(ChangeNotifierProvider(
    create: (_) => Cart(),
    child: MyApp(),
  ));
}
