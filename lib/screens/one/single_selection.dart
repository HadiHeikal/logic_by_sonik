import 'package:flutter/material.dart';

class SingleSelect extends StatefulWidget {
  const SingleSelect({super.key});

  @override
  State<SingleSelect> createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {
  int? selectedIndex;
  List<Map<String, String>> gifts = [
    {"name": "cow", "image": "assets/animals/cow.png"},
    {"name": "deer", "image": "assets/animals/deer.png"},
    {"name": "giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "lion", "image": "assets/animals/lion.png"},
    {"name": "pingeon", "image": "assets/animals/pingeon.png"},
    {"name": "rat", "image": "assets/animals/rat.png"},
    {"name": "tiger", "image": "assets/animals/tiger.png"},
    {"name": "white-tiger", "image": "assets/animals/white-tiger.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  selectedIndex == index
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.purple.shade900,
                                  Colors.purple.shade700,
                                  Colors.purple.shade500,
                                  Colors.purple.shade300,
                                  Colors.purple.shade100,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),

                  Center(
                    child: Column(
                      children: [
                        selectedIndex == index
                            ? Image.asset(gifts[index]["image"]!, height: 100)
                            : Image.asset(gifts[index]["image"]!, height: 70),
                        SizedBox(height: 10),

                        selectedIndex != index
                            ? Text(
                                gifts[index]["name"]!.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),

                  selectedIndex == index
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: double.infinity,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade900,
                              borderRadius: BorderRadius.circular(3),
                            ),

                            child: Center(
                              child: Text(
                                "Send",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
          itemCount: gifts.length,
        ),
      ),
    );
  }
}
