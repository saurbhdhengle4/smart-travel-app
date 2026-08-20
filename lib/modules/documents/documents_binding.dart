import 'package:get/get.dart';
import 'documents_controller.dart';
import '../../core/services/file_service.dart';
import '../../core/services/firebase_storage_service.dart';
import '../../core/services/firestore_service.dart';

class DocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FileService());
    Get.lazyPut(() => FirebaseStorageService());
    Get.lazyPut(() => FirestoreService());
    Get.lazyPut(() => DocumentsController());
  }
}