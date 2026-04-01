import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideos extends StatefulWidget {
  const UploadVideos({super.key});

  @override
  State<UploadVideos> createState() => _UploadVideosState();
}

class _UploadVideosState extends State<UploadVideos> {
  VideoPlayerController? _videoPlayerController;

  Future<void> _pickVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedVideo = await picker.pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVideo != null) {
      _videoPlayerController?.dispose();

      _videoPlayerController =
          VideoPlayerController.file(File(pickedVideo.path))
            ..initialize().then((_) {
              _videoPlayerController!.setLooping(true);
              _videoPlayerController!.play();
              setState(() {});
            });
    }
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            _buildVideoPlayer(),
            SizedBox(height: 20),
            _buildUploadButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return GestureDetector(
      onTap: () {
        if (_videoPlayerController != null &&
            _videoPlayerController!.value.isInitialized) {
          setState(() {
            if (_videoPlayerController!.value.isPlaying) {
              _videoPlayerController!.pause();
            } else {
              _videoPlayerController!.play();

              Future.delayed(Duration(milliseconds: 600), () {
                setState(() {});
              });
            }
          });
        }
      },
      child: Container(
        height: 180,
        width: 350,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:
            _videoPlayerController != null &&
                _videoPlayerController!.value.isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: SizedBox(
                        width: _videoPlayerController!.value.size.width,
                        height: _videoPlayerController!.value.size.height,
                        child: VideoPlayer(_videoPlayerController!),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: !_videoPlayerController!.value.isPlaying
                        ? 1.0
                        : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        _videoPlayerController!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              )
            : Icon(
                Icons.video_collection,
                size: 80,
                color: Colors.grey.shade400,
              ),
      ),
    );
  }

  Widget _buildUploadButton() {
    return GestureDetector(
      onTap: _pickVideo,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "Upload Video",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
