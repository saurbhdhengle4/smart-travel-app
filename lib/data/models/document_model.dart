class DocumentModel {
  final String id;
  final String fileName;
  final String fileUrl;
  final DateTime createdAt;

  DocumentModel({required this.id, required this.fileName, required this.fileUrl, required this.createdAt});

  factory DocumentModel.fromMap(String id, Map<String, dynamic> map) {
    return DocumentModel(
      id: id,
      fileName: map['fileName'] as String,
      fileUrl: map['fileUrl'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'fileName': fileName,
        'fileUrl': fileUrl,
        'createdAt': createdAt.toIso8601String(),
      };
}