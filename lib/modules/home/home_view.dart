import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../../widgets/weather_card.dart';
import '../../app/routes/app_routes.dart';
import '../auth/auth_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Travel Companion')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(controller.address.value),
            const SizedBox(height: 12),
            if (controller.weather.value != null) WeatherCard(weather: controller.weather.value!),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Get.toNamed(AppRoutes.map), child: const Text('Open Google Maps')),
            ElevatedButton(onPressed: () => Get.toNamed(AppRoutes.documents), child: const Text('My Documents')),
            ElevatedButton(onPressed: () {}, child: const Text('Test Notification')),
            OutlinedButton(onPressed: auth.logout, child: const Text('Logout')),
          ],
        );
      }),
    );
  }
}