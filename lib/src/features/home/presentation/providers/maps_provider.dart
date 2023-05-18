import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rest_house_rd/src/config/helpers/image_formats.dart';

final markersProvier =
    StateNotifierProvider<MarkerNotifier, Set<Marker>>((ref) {
  return MarkerNotifier();
});

class MarkerNotifier extends StateNotifier<Set<Marker>> {
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  MarkerNotifier() : super({});

  Future<void> getMarkers() async {
    final Uint8List markIcons =
        await ImageFormats.getBytesImages('assets/images/home.png', 100);
    customIcon = BitmapDescriptor.fromBytes(markIcons);

    final market = Marker(
      markerId: const MarkerId("marker1"),
      position: const LatLng(18.471941, -69.902751),
      icon: customIcon,
      onTap: () {},
    );
    state = {...state, market};
  }
}

final visibleProvider = StateProvider<bool>(
  (ref) => true,
);
