import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});

  final mapController = MapController();
  static const epsiLatLng = LatLng(47.2060287, -1.5393726);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {mapController.move(epsiLatLng, 18), mapController.rotate(0)},
        child: const Icon(Icons.location_on),
      ),
      body: FlutterMap(
          mapController: mapController,
          options: const MapOptions(
            initialCenter: epsiLatLng,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            const MarkerLayer(markers: [
              Marker(child: Icon(Icons.school), point: epsiLatLng)
            ]),
          ]),
    );
  }
}
