import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  // Runs in a separate isolate when the app is backgrounded or terminated
  print('Background FCM message: ${message.notification?.title}');
}

class FcmService {
  final NotificationService _notificationService;
  FcmService(this._notificationService);

  Future<void> init() async {
    await FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification != null) {
        _notificationService.showNotification(notification.title ?? '', notification.body ?? '');
      }
    });
  }

  Future<String?> getToken() => FirebaseMessaging.instance.getToken();
}