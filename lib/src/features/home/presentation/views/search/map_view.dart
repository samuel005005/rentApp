import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rest_house_rd/src/config/theme/uber_map_theme.dart';
import 'package:rest_house_rd/src/features/home/presentation/providers/maps_provider.dart';

import 'widgets/draw_button.dart';
import 'widgets/location_button.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  MapViewState createState() => MapViewState();
}

class MapViewState extends ConsumerState<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.477518, -69.897945),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    ref.read(markersProvier.notifier).getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroudColor = Theme.of(context).colorScheme.background;
    final markers = ref.watch(markersProvier);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(jsonEncode(dartThemeMap));
              _controller.complete(controller);
            },
            markers: markers,
          ),
          Positioned(
            top: 5,
            right: size.width * .3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroudColor,
              ),
              child: const Text("20.36K Home New York"),
            ),
          )
        ],
      ),
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LocationButton(),
          DrawLocation(),
        ],
      ),
    );
  }
}
