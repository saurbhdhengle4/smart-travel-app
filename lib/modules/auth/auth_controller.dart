import 'package:get/get.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/local_storage_service.dart';
import '../../app/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find();
  final LocalStorageService _storage = Get.find();

  final isLoading = false.obs;
  final errorMessage = RxnString();

  Future<void> loginWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final cred = await _authService.loginWithEmail(email, password);
      await _storage.saveSession(cred.user!.uid);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final cred = await _authService.registerWithEmail(email, password);
      await _storage.saveSession(cred.user!.uid);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;
      final cred = await _authService.loginWithGoogle();
      await _storage.saveSession(cred.user!.uid);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    await _storage.clearSession();
    Get.offAllNamed(AppRoutes.login);
  }
}