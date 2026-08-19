import 'package:get/get.dart';
import 'auth_controller.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/local_storage_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => LocalStorageService());
    Get.lazyPut(() => AuthController());
  }
}