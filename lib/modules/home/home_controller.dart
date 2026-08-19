import 'package:get/get.dart';
import '../../core/services/location_service.dart';
import '../../core/services/weather_service.dart';
import '../../data/models/weather_model.dart';

class HomeController extends GetxController {
  final LocationService _locationService = Get.find();
  final WeatherService _weatherService = Get.find();

  final isLoading = false.obs;
  final address = ''.obs;
  final weather = Rxn<WeatherModel>();

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    isLoading.value = true;
    final location = await _locationService.getCurrentLocationWithAddress();
    address.value = location.address;
    weather.value = await _weatherService.fetchWeather(location.latitude, location.longitude);
    isLoading.value = false;
  }
}