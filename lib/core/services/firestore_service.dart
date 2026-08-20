import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/document_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _documentsRef(String userId) =>
      _db.collection('users').doc(userId).collection('documents');

  Future<void> saveDocument(String userId, String fileName, String fileUrl) {
    return _documentsRef(userId).add({
      'fileName': fileName,
      'fileUrl': fileUrl,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Stream<List<DocumentModel>> watchDocuments(String userId) {
    return _documentsRef(userId).orderBy('createdAt', descending: true).snapshots().map(
          (snap) => snap.docs.map((d) => DocumentModel.fromMap(d.id, d.data())).toList(),
        );
  }
}