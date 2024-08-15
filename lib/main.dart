import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Discover",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          actions: const [
            Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.black,
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 60,
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 20),
                            Icon(Icons.search, size: 30),
                            SizedBox(width: 20),
                            Text(
                              "Search Anything",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const FilterSection(itemName: 'Men'),
                      const SizedBox(width: 15),
                      const FilterSection(itemName: 'Women'),
                      const SizedBox(width: 15),
                      const FilterSection(itemName: 'Kids'),
                      const SizedBox(width: 15),
                      const FilterSection(itemName: 'Shirts'),
                      const SizedBox(width: 15),
                      const FilterSection(itemName: 'Pants'),
                      const SizedBox(width: 15),
                      const FilterSection(itemName: 'Inners'),
                      const SizedBox(width: 15),
                      const FilterSection(itemName: 'Hat'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.6),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(items[index]['image']),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 2,
                                              spreadRadius: 1,
                                            )
                                          ]),
                                      child: const Icon(Icons.favorite_border),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                items[index]['itemName'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, bottom: 5),
                              child: Text(
                                items[index]['price'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for Scrolling of Categories or Items
class FilterSection extends StatelessWidget {
  final String itemName;

  const FilterSection({required this.itemName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          itemName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// List Map of image,itemName,price
final List items = [
  {
    'image': 'assets/images/d1.png',
    'itemName': 'Cotton Shirt',
    'price': 'Rs 2,299'
  },
  {
    'image': 'assets/images/d2.png',
    'itemName': 'Woolen Sweater',
    'price': 'Rs 3,499'
  },
  {
    'image': 'assets/images/d3.png',
    'itemName': 'Leather Jacket',
    'price': 'Rs 4,999'
  },
  {
    'image': 'assets/images/d4.png',
    'itemName': 'Denim Jeans',
    'price': 'Rs 2,099'
  },
  {
    'image': 'assets/images/d5.png',
    'itemName': 'Chinos Pants',
    'price': 'Rs 1,799'
  },
  {
    'image': 'assets/images/d6.png',
    'itemName': 'Formal Trousers',
    'price': 'Rs 2,499'
  },
  {
    'image': 'assets/images/d7.png',
    'itemName': 'Casual Polo Shirt',
    'price': 'Rs 1,999'
  },
  {
    'image': 'assets/images/d8.png',
    'itemName': 'Blazer Jacket',
    'price': 'Rs 5,499'
  },
  {'image': 'assets/images/d9.png', 'itemName': 'Silk Tie', 'price': 'Rs 899'},
  {
    'image': 'assets/images/d10.png',
    'itemName': 'Linen Shirt',
    'price': 'Rs 2,199'
  },
  {
    'image': 'assets/images/d11.png',
    'itemName': 'Knit Sweater',
    'price': 'Rs 2,799'
  },
  {
    'image': 'assets/images/d12.png',
    'itemName': 'Hooded Jacket',
    'price': 'Rs 3,999'
  },
  {
    'image': 'assets/images/d13.png',
    'itemName': 'Slim Fit Jeans',
    'price': 'Rs 2,299'
  },
  {
    'image': 'assets/images/d14.png',
    'itemName': 'Cargo Pants',
    'price': 'Rs 2,099'
  },
  {
    'image': 'assets/images/d15.png',
    'itemName': 'Button-Down Shirt',
    'price': 'Rs 1,799'
  },
  {
    'image': 'assets/images/d16.png',
    'itemName': 'Double-Breasted Blazer',
    'price': 'Rs 6,299'
  },
  {
    'image': 'assets/images/d17.png',
    'itemName': 'Cardigan Sweater',
    'price': 'Rs 2,499'
  },
  {
    'image': 'assets/images/d18.png',
    'itemName': 'Overcoat',
    'price': 'Rs 7,499'
  },
  {
    'image': 'assets/images/d19.png',
    'itemName': 'Plaid Shirt',
    'price': 'Rs 1,999'
  },
  {
    'image': 'assets/images/d20.png',
    'itemName': 'V-Neck Sweater',
    'price': 'Rs 2,299'
  },
];
