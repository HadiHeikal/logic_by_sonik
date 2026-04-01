import 'package:flutter/material.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({super.key});

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {
  //data for search results
  List<Map<String, dynamic>> products = [
    {
      'image': 'assets/laptop/labtop1.png',
      'title': 'lenovo laptop',
      'price': 10000,
    },
    {
      'image': 'assets/laptop/labtop2.png',
      'title': 'dell laptop',
      'price': 14000,
    },
    {'image': 'assets/laptop/labtop3.png', 'title': 'hp laptop', 'price': 8000},
    {
      'image': 'assets/laptop/labtop4.png',
      'title': 'asus laptop',
      'price': 7000,
    },
    {
      'image': 'assets/laptop/labtop3.png',
      'title': 'acer laptop',
      'price': 17000,
    },
    {
      'image': 'assets/laptop/labtop2.png',
      'title': 'toshiba laptop',
      'price': 13000,
    },
  ];
  // search logic
  List<Map<String, dynamic>> searchResults = [];

  // perform search
  void performSearch(String query) {
    setState(() {
      searchResults = products
          .where(
            (product) =>
                product['title'].toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  // clear search
  void clearSearch() {
    _controller.clear();
    performSearch('');
  }

  // sort by price low to high
  void sortByPriceLowToHigh() {
    setState(() {
      searchResults.sort((a, b) => a['price'].compareTo(b['price']));
    });
  }

  // sort by price high to low
  void sortByPriceHighToLow() {
    setState(() {
      searchResults.sort((a, b) => b['price'].compareTo(a['price']));
    });
  }

  // sort by title alphabetically
  void sortByTitle() {
    setState(() {
      searchResults.sort((a, b) => a['title'].compareTo(b['title']));
    });
  }

  // sort by title reverse alphabetically
  void sortByTitleReverse() {
    setState(() {
      searchResults.sort((a, b) => b['title'].compareTo(a['title']));
    });
  }

  // clear search

  @override
  void initState() {
    super.initState();
    searchResults = products; // show all products initially
  }

  // dispose the text field controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // text field controller
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70, width: double.infinity),

          // search text field
          SizedBox(
            width: 360,
            child: TextField(
              controller: _controller,
              onChanged: performSearch,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                suffixIcon: _controller.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          clearSearch();
                        },
                        child: Icon(Icons.close, color: Colors.white54),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Search by category title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.text = 'lenovo';
                  performSearch('lenovo');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'lenovo',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _controller.text = 'dell';
                  performSearch('dell');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'dell',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _controller.text = 'hp';
                  performSearch('hp');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'hp',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _controller.text = 'asus';
                  performSearch('asus');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'asus',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _controller.text = 'acer';
                  performSearch('acer');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'acer',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Sort options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: sortByPriceLowToHigh,
                child: Column(
                  children: [
                    Icon(Icons.filter_list, color: Colors.white54),
                    SizedBox(height: 4),
                    Text(
                      'Low to High',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: sortByPriceHighToLow,
                child: Column(
                  children: [
                    Icon(Icons.filter_list, color: Colors.white54),
                    SizedBox(height: 4),
                    Text(
                      'High to Low',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),

              // sort by title alphabetically
              GestureDetector(
                onTap: sortByTitle,
                child: Column(
                  children: [
                    Icon(Icons.sort_by_alpha, color: Colors.white54),
                    SizedBox(height: 4),
                    Text(
                      'A-Z',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),

              // sort by title reverse alphabetically
              GestureDetector(
                onTap: sortByTitleReverse,
                child: Column(
                  children: [
                    Icon(Icons.sort_by_alpha, color: Colors.white54),
                    SizedBox(height: 4),
                    Text(
                      'Z-A',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),

              // clear search
              GestureDetector(
                onTap: () {
                  setState(() {
                    searchResults = List<Map<String, dynamic>>.from(products);
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.clear, color: Colors.white54),
                    SizedBox(height: 4),
                    Text(
                      'Clear',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // search results
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];

                return ListTile(
                  leading: Image.asset(
                    product['image'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    product['title'],
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${product['price']}',
                    style: TextStyle(color: Colors.white54),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
