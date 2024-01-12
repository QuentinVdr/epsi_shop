import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Finalisation de la commande'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Consumer<Cart>(
                builder: (BuildContext context, Cart cart, Widget? child) {
                  return SummaryCart(cart: cart);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const AdresseCard(),
              Spacer(),
              ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      onPrimary: Colors.white,
                      elevation: 5),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text('Procéder au paiement'),
                      Spacer(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryCart extends StatelessWidget {
  const SummaryCart({super.key, required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Récapitiulatif de votre commande',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text('Sous-total'),
                Spacer(),
                Text(
                  cart.getTotalEnEuros(),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Text('TVA'),
                Spacer(),
                Text(
                  cart.getTVAEnEuros(),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text('TOTAL',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text(
                  cart.getTotalTVAEnEuros(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AdresseCard extends StatelessWidget {
  const AdresseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
          alignment: Alignment.centerLeft,
          child: Text("Adresse de livraison",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Philipe Dupont',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('16 Bd Général de Gaulle')),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('44200 Nantes')),
              ],
            ),
            Icon(Icons.chevron_right)
          ]),
        ),
      ),
    ]);
  }
}
