import 'dart:ui';

import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends ConsumerWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<LatLng> points = [
      LatLng(47.479250, -0.566020), // Bar 1
      LatLng(47.478960, -0.565500), // Bar 2
      LatLng(47.478550, -0.565870), // Bar 3
      LatLng(47.477920, -0.564920), // Café 1
      LatLng(47.477630, -0.564400), // Café 2
      LatLng(47.478200, -0.561950), // Parc 1
      LatLng(47.478470, -0.563220), // Parc 2
      LatLng(47.479170, -0.561550), // Cinéma 1
      LatLng(47.478630, -0.562250), // Cinéma 2
      LatLng(47.479560, -0.564300), // Restaurant 1
      LatLng(47.479110, -0.564890), // Restaurant 2
      LatLng(47.477890, -0.565370), // Salle de sport 1
      LatLng(47.477410, -0.565200), // Salle de sport 2
      LatLng(47.478700, -0.564210), // Club de danse 1
      LatLng(47.478920, -0.563550), // Club de danse 2
      LatLng(47.479350, -0.564950), // Théâtre 1
      LatLng(47.478890, -0.565320), // Théâtre 2
      LatLng(47.478530, -0.566480), // Musée 1
      LatLng(47.479150, -0.566750), // Musée 2
      LatLng(47.479430, -0.564110), // Galerie d'art 1
      LatLng(47.478870, -0.563680), // Galerie d'art 2
      LatLng(47.478980, -0.566060), // Discothèque 1
      LatLng(47.478440, -0.566360), // Discothèque 2
      LatLng(47.479070, -0.565080), // Bowling 1
      LatLng(47.478540, -0.564640), // Bowling 2
      LatLng(47.478170, -0.565230), // Escape game 1
      LatLng(47.479280, -0.564790), // Escape game 2
      LatLng(47.478840, -0.563150), // Billard 1
      LatLng(47.478420, -0.562680), // Billard 2
      LatLng(47.479060, -0.564950), // Parc d'attractions 1
      LatLng(47.478510, -0.565350), // Parc d'attractions 2
    ];
    return Scaffold(
      appBar: appBarReception(context),
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(47.478706,
                -0.563791), // Coordonnées de l'école MyDigitalSchool à Angers
            zoom: 17.0, // Niveau de zoom initial
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(
              markers: List.generate(points.length, (index) {
                return Marker(
                  width: 30.0,
                  height: 30.0,
                  point: points[index],
                  builder: (ctx) => const Icon(
                    Icons.location_pin,
                    color: coulOrange,
                  ),
                );
              }),
            ),
          ],
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3), // Ajustez les valeurs de flou selon vos besoins
          child: Container(
            color: Colors
                .transparent, // Couleur transparente pour appliquer le flou sans changer la couleur de fond
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(30),
              color: Colors.white,
              child: const Text(
                "Vous devez disposer d'un abonnement prenium pour accèder à ceci",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
