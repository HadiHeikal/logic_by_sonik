import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({super.key});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> categories = [
    "News",
    "Business",
    "Health",
    "Entertainment",
    "Sports",
    "Technology",
    "Science",
    "Politics",
    "Travel",
    "Food",
    "Gaming",
    "Music",
    "Fashion",
    "Books",
    "Movies",
  ];
  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                "Select your favorite categories",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  bool isSelected = selectedCategories.contains(category);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedCategories.remove(category);
                        } else {
                          selectedCategories.add(category);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // selected categories
              SizedBox(height: 30),
              Text(
                "Selected categories:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: selectedCategories.map((category) {
                  return Chip(
                    label: Text(category),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
