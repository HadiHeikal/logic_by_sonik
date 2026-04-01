import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelect extends StatefulWidget {
  const ToggleSelect({super.key});

  @override
  State<ToggleSelect> createState() => _ToggleSelectState();
}

class _ToggleSelectState extends State<ToggleSelect> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Stack(
              clipBehavior: Clip.none,
              children: [
                // image
                CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage("assets/sonic.png"),
                ),

                Positioned(
                  bottom: -20,
                  right: 0,
                  left: 0,

                  // toggle button
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      radius: 25,
                      child: Icon(
                        isSelected
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isSelected ? CupertinoIcons.check_mark : CupertinoIcons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Rich Sonic",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
