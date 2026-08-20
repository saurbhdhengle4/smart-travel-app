import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FileService {
  Future<File?> pickDocument() async {
    await Permission.storage.isDenied.then((value) {
      if (value) {
        Permission.storage.request();
      }
    });
    
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result.single.path == null) return null;
    return File(result.single.path!);
  }
}
