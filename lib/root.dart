import 'package:flutter/material.dart';
import 'package:logic_by_sonik/screens/one/multi_image_select.dart';
import 'package:logic_by_sonik/screens/one/multi_select.dart';
import 'package:logic_by_sonik/screens/one/single_selection.dart';
import 'package:logic_by_sonik/screens/one/toggle_selection.dart';
import 'package:logic_by_sonik/screens/three/form_validation.dart';
import 'package:logic_by_sonik/screens/three/search_feature.dart';
import 'package:logic_by_sonik/screens/two/upload_file.dart';
import 'package:logic_by_sonik/screens/two/upload_image.dart';
import 'package:logic_by_sonik/screens/two/upload_multi_image.dart';
import 'package:logic_by_sonik/screens/two/upload_videos.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController pageController = PageController();
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
    // 1- Selection
    SingleSelect(),
    MultiImageSelect(),
    ToggleSelect(),
    MultiSelect(),

    // 2- Uploading
    UploadImage(),
    UploadMultiImage(),
    UploadVideos(),
    UploadFiles(),

    // 3- Searching
    SearchFeature(),

    // 4- Form Validation
    FormValidation(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screens,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // back
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(
                        // if we are on the first page, go to the last page, else go to the previous page
                        currentIndex == 0
                            ? screens.length - 1
                            : currentIndex - 1,
                      );
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 14),
                // next
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(
                        // if we are on the last page, go to the first page, else go to the next page
                        currentIndex == screens.length - 1
                            ? 0
                            : currentIndex + 1,
                      );
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      children: [
                        Text(
                          'next page',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 14),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
