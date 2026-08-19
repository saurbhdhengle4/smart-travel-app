import 'package:get/get.dart';
import 'map_controller.dart';
import '../../core/services/location_service.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationService());
    Get.lazyPut(() => MapController());
  }
}