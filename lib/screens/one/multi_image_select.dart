import 'package:flutter/material.dart';

class MultiImageSelect extends StatefulWidget {
  const MultiImageSelect({super.key});

  @override
  State<MultiImageSelect> createState() => _MultiImageSelectState();
}

class _MultiImageSelectState extends State<MultiImageSelect> {
  List<String> laptop = [
    'assets/laptop/labtop1.png',
    'assets/laptop/labtop2.png',
    'assets/laptop/labtop4.png',
    'assets/laptop/labtop3.png',
  ];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdee00),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Image(
              image: AssetImage(laptop[selectedIndex ?? 0]),
              height: 300,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 10),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                laptop.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: selectedIndex == index
                          ? Border.all(color: Colors.brown, width: 2)
                          : Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                    child: Image(
                      image: AssetImage(laptop[index]),
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
