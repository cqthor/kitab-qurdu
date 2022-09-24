import 'package:flutter/material.dart';
import 'package:kitab_qurdu/color.dart';
import 'package:kitab_qurdu/size.dart';
import 'package:kitab_qurdu/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> categories = [
  'Dystopian',
  'Advanture',
  'Fantasy',
  'Horror',
  'Romance'
];

var products = [
  {
    "name": "Tutunamayanlar",
    "author": "Oğuz Atay",
    "image": "assets/images/atay.png",
    "price": "10",
  },
  {
    "name": "Tutunamayanlar",
    "author": "Oğuz Atay",
    "image": "assets/images/atay.png",
    "price": "10",
  },
  {
    "name": "Tutunamayanlar",
    "author": "Oğuz Atay",
    "image": "assets/images/atay.png",
    "price": "10",
  },
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: getHeight(10, context)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20, context)),
              height: getHeight(50, context),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: getWidth(246, context),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        // fillColor: kSearchColor,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search books, author an account",
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: getWidth(70, context),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(18, context)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/categories');
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(10, context)),
            SizedBox(
              height: getHeight(40, context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            left: getWidth(20, context),
                            right: getWidth(10, context))
                        : index == categories.length - 1
                            ? EdgeInsets.only(right: getWidth(20, context))
                            : EdgeInsets.only(right: getWidth(10, context)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(20, context),
                          vertical: getHeight(10, context)),
                      decoration: BoxDecoration(
                        color: kCategoryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: getHeight(20, context)),
            SizedBox(
              width: getWidth(330, context),
              child: Row(
                children: const <Text>[
                  Text(
                    'Popular Books',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(10, context)),
            SizedBox(
              height: getHeight(270, context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            left: getWidth(20, context),
                            right: getWidth(10, context))
                        : index == products.length - 1
                            ? EdgeInsets.only(right: getWidth(20, context))
                            : EdgeInsets.only(right: getWidth(10, context)),
                    child: ProductCard(
                      title: products[index]['name']!,
                      author: products[index]['author']!,
                      image: products[index]['image']!,
                      price: products[index]['price']!,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: getHeight(20, context)),
            SizedBox(
              width: getWidth(330, context),
              child: Row(
                children: const <Text>[
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(270, context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            left: getWidth(20, context),
                            right: getWidth(10, context))
                        : index == products.length - 1
                            ? EdgeInsets.only(right: getWidth(20, context))
                            : EdgeInsets.only(right: getWidth(10, context)),
                    child: ProductCard(
                      title: products[index]['name']!,
                      author: products[index]['author']!,
                      image: products[index]['image']!,
                      price: products[index]['price']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
