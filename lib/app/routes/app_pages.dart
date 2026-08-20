import 'package:get/get.dart';
import 'package:smart_travel/modules/documents/documents_binding.dart';
import 'package:smart_travel/modules/documents/documents_view.dart';
import 'package:smart_travel/modules/map/map_binding.dart';
import 'package:smart_travel/modules/map/map_view.dart';
import 'package:smart_travel/modules/splash/splash_binding.dart';
import 'package:smart_travel/modules/splash/splash_view.dart';
import 'app_routes.dart';

import '../../modules/auth/login_view.dart';
import '../../modules/auth/auth_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.map,
      page: () => const MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: AppRoutes.documents,
      page: () => const DocumentsView(),
      binding: DocumentsBinding(),
    ),

    // Home, Map and Documents pages are added in Day 3 and Day 4
  ];
}
