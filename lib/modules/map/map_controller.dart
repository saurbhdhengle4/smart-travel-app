import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/services/location_service.dart';

class MapController extends GetxController {
  final LocationService _locationService = Get.find();

  RxBool isLoading = false.obs;
  RxString address = ''.obs;
  Rxn<LatLng> currentPosition = Rxn<LatLng>();
  RxSet<Marker> markers = <Marker>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadCurrentLocation();
  }

  Future<void> loadCurrentLocation() async {
    isLoading.value = true;
    final result = await _locationService.getCurrentLocationWithAddress();
    final latLng = LatLng(result.latitude, result.longitude);
    currentPosition.value = latLng;
    address.value = result.address;
    markers.value = {
      Marker(
        markerId: const MarkerId('current'),
        position: latLng,
        infoWindow: InfoWindow(title: result.address),
      ),
    };
    isLoading.value = false;
  }
}
