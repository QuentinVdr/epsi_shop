import 'package:epsi_shop/bo/article.dart';
import 'package:epsi_shop/pages/about_us_page.dart';
import 'package:epsi_shop/pages/cart_page.dart';
import 'package:epsi_shop/pages/detail_page.dart';
import 'package:epsi_shop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'cart',
          name: 'cart',
          builder: (BuildContext context, GoRouterState state) => CartPage(),
        ),
        GoRoute(
            path: 'detail',
            name: 'detail',
            builder: (BuildContext context, GoRouterState state) =>
                DetailPage(article: state.extra as Article)),
        GoRoute(
          path: 'aboutus',
          name: 'aboutus',
          builder: (BuildContext context, GoRouterState state) => AboutUsPage(),
        ),
      ],
    ),
  ],
);
