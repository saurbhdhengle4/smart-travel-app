import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadDocument(String userId, File file, String fileName) async {
    final ref = _storage.ref('users/$userId/documents/$fileName');
    final task = await ref.putFile(file);
    return task.ref.getDownloadURL();
  }
}