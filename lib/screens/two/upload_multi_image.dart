import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImage extends StatefulWidget {
  const UploadMultiImage({super.key});

  @override
  State<UploadMultiImage> createState() => _UploadMultiImageState();
}

class _UploadMultiImageState extends State<UploadMultiImage> {
  List<XFile>? selectedImages = [];
  // upload multi image logic will be here
  Future<void> uploadMultiImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedImages = await picker.pickMultiImage(limit: 3);

    setState(() {
      selectedImages = pickedImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child:
                      // if there are images, show them, else show the upload icon
                      selectedImages != null &&
                          selectedImages!.isNotEmpty &&
                          index < selectedImages!.length
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File(selectedImages![index].path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.image,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                );
              }),
            ),
            SizedBox(height: 50),

            // upload button
            GestureDetector(
              onTap: () => uploadMultiImage(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Upload Multi Images",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.pink.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // remove images button if there are images
            if (selectedImages != null && selectedImages!.isNotEmpty)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImages = [];
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Remove Images",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.pink.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
