import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'documents_controller.dart';

class DocumentsView extends GetView<DocumentsController> {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Documents')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.documents.length,
          itemBuilder: (context, i) {
            final doc = controller.documents[i];
            return ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: Text(doc.fileName),
              subtitle: Column(
                children: [
                  Text(doc.createdAt.toString()),
                  TextButton(
                    onPressed: () {
                      controller.viewlaunchUrl("tel:9966332255");
                    },
                    child: Text("9966332255"),
                  ),
                ],
              ),
              onTap: () {
                controller.viewlaunchUrl(doc.fileUrl);
              },
            );
          },
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: controller.isUploading.value
              ? null
              : controller.pickAndUpload,
          child: controller.isUploading.value
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.upload_file),
        ),
      ),
    );
  }
}
