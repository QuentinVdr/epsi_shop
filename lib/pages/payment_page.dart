import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text("Merci pour l'argent"),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Finalisation de la commande'),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
              const SizedBox(
                height: 16,
              ),
              PaymentMethode(
                selectedPaymentMethod: "",
              ),
              Spacer(),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "En cliquant Sur Confirmer vous acceptez les Conditions de vente de EPSI Shop International. Besoin daide ? Désolé on peut rien faire \n En poursuivant, acceptez les Conditions d'utilisation du fournisseur de paiement CotfeeDis.",
                      style: TextStyle(fontSize: 10))),
              ElevatedButton(
                  onPressed: () =>
                      {ScaffoldMessenger.of(context).showSnackBar(snackBar)},
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      onPrimary: Colors.white,
                      elevation: 5),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text("Confirmer l'achat"),
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

class PaymentMethode extends StatefulWidget {
  final String selectedPaymentMethod;

  PaymentMethode({required this.selectedPaymentMethod});

  @override
  _PaymentMethodeState createState() => _PaymentMethodeState();
}

class _PaymentMethodeState extends State<PaymentMethode> {
  String selectedPaymentMethod = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        selectedPaymentMethod == "ApplePay"
            ? Badge(
                backgroundColor: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, 0),
                label: const Icon(
                  Icons.check,
                  size: 10,
                ),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    child: IconButton(
                      onPressed: () =>
                          setState(() => selectedPaymentMethod = "ApplePay"),
                      icon: FaIcon(
                        FontAwesomeIcons.ccApplePay,
                        size: 52,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              )
            : Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: IconButton(
                  onPressed: () =>
                      setState(() => selectedPaymentMethod = "ApplePay"),
                  icon: const FaIcon(
                    FontAwesomeIcons.ccApplePay,
                    size: 52,
                  ),
                )),
        selectedPaymentMethod == "Visa"
            ? Badge(
                backgroundColor: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, 0),
                label: const Icon(
                  Icons.check,
                  size: 10,
                ),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    child: IconButton(
                      onPressed: () =>
                          setState(() => selectedPaymentMethod = "Visa"),
                      icon: FaIcon(
                        FontAwesomeIcons.ccVisa,
                        size: 52,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              )
            : Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: IconButton(
                  onPressed: () =>
                      setState(() => selectedPaymentMethod = "Visa"),
                  icon: const FaIcon(
                    FontAwesomeIcons.ccVisa,
                    size: 52,
                  ),
                )),
        selectedPaymentMethod == "MasterCard"
            ? Badge(
                backgroundColor: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, 0),
                label: const Icon(
                  Icons.check,
                  size: 10,
                ),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    child: IconButton(
                      onPressed: () =>
                          setState(() => selectedPaymentMethod = "MasterCard"),
                      icon: FaIcon(
                        FontAwesomeIcons.ccMastercard,
                        size: 52,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              )
            : Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: IconButton(
                  onPressed: () =>
                      setState(() => selectedPaymentMethod = "MasterCard"),
                  icon: const FaIcon(
                    FontAwesomeIcons.ccMastercard,
                    size: 52,
                  ),
                )),
        selectedPaymentMethod == "PayPal"
            ? Badge(
                backgroundColor: Theme.of(context).colorScheme.primary,
                offset: const Offset(0, 0),
                label: const Icon(
                  Icons.check,
                  size: 10,
                ),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    child: IconButton(
                      onPressed: () =>
                          setState(() => selectedPaymentMethod = "PayPal"),
                      icon: FaIcon(
                        FontAwesomeIcons.ccPaypal,
                        size: 52,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              )
            : Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: IconButton(
                  onPressed: () =>
                      setState(() => selectedPaymentMethod = "PayPal"),
                  icon: const FaIcon(
                    FontAwesomeIcons.ccPaypal,
                    size: 52,
                  ),
                )),
      ],
    );
  }
}
