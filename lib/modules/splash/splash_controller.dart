import 'package:get/get.dart';
import '../../core/services/local_storage_service.dart';
import '../../app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalStorageService _storage = Get.find();

  @override
  void onReady() {
    super.onReady();
    _decideNextRoute();
  }

  Future<void> _decideNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    final loggedIn = await _storage.isLoggedIn();
    Get.offAllNamed(loggedIn ? AppRoutes.home : AppRoutes.login);
  }
}