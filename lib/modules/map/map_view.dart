import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Location')),
      body: Obx(() {
        if (controller.isLoading.value || controller.currentPosition.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final pos = controller.currentPosition.value!;
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: pos, zoom: 16),
              markers: controller.markers.value,
              myLocationEnabled: true,
            ),
            Positioned(
              left: 16, right: 16, bottom: 90,
              child: Card(child: Padding(padding: const EdgeInsets.all(12), child: Text(controller.address.value))),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.loadCurrentLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}