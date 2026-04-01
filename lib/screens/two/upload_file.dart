import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadFiles extends StatefulWidget {
  const UploadFiles({super.key});

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
  String? _fileName;
  String? _filePath;
  // pick file function
  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx', 'doc', 'jpg'],
      );
      if (result != null && result.files.single.name.isNotEmpty) {
        setState(() {
          _fileName = result.files.single.name;
          _filePath = result.files.single.path;
        });
      }
      // print(_fileName);
    } catch (e) {
      //print(e);
    }
  }

  // open file function
  Future<void> _openFile(String? filePath) async {
    await OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            Container(
              alignment: Alignment.center,
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),

                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/doc.svg",
                    height: 65,
                    width: 50,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _fileName == null
                            ? "Upload Files"
                            : _fileName!.split('.').first.length > 15
                            ? "${_fileName!.split('.').first.substring(0, 15)}..."
                            : _fileName!.split('.').first,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(PNG, JPEG, PDF, DOC)",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        // upload image button
                        PopupMenuItem(
                          onTap: _pickFile,
                          child: Row(
                            children: [
                              Icon(Icons.upload_sharp, color: Colors.black54),
                              SizedBox(width: 5),
                              Text(
                                "Upload",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // view image button
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.eye, color: Colors.black54),
                              SizedBox(width: 5),
                              Text(
                                "View",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // change image button
                        PopupMenuItem(
                          onTap: _pickFile,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.pencil,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Change",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // delete image button
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              _fileName = null;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.black54),
                              SizedBox(width: 5),
                              Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            if (_filePath != null && _filePath!.endsWith('.pdf'))
              Container(
                alignment: Alignment.center,
                height: 400,
                width: 330,
                child: SfPdfViewer.file(File(_filePath!)),
              ),
          ],
        ),
      ),
    );
  }
}
