import 'package:get/get.dart';
import 'splash_controller.dart';
import '../../core/services/local_storage_service.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalStorageService());
    Get.lazyPut(() => SplashController());
  }
}