import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/services/file_service.dart';
import '../../core/services/firebase_storage_service.dart';
import '../../core/services/firestore_service.dart';
import '../../data/models/document_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentsController extends GetxController {
  final FileService _fileService = Get.find();
  final FirebaseStorageService _storageService = Get.find();
  final FirestoreService _firestoreService = Get.find();

  final isUploading = false.obs;
  final documents = <DocumentModel>[].obs;

  String get _uid => FirebaseAuth.instance.currentUser!.uid;

  @override
  void onInit() {
    super.onInit();
    _firestoreService
        .watchDocuments(_uid)
        .listen((docs) => documents.value = docs);
  }

  Future<void> pickAndUpload() async {
    final file = await _fileService.pickDocument();
    if (file == null) return;

    isUploading.value = true;
    final fileName = file.path.split('/').last;
    final url = await _storageService.uploadDocument(_uid, file, fileName); //
    await _firestoreService.saveDocument(_uid, fileName, url);
    isUploading.value = false;
  }

  Future<void> viewlaunchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
