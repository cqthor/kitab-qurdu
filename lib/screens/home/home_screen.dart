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
            SizedBox(
              width: getWidth(330, context),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20, context)),
              height: getHeight(40, context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: getWidth(10, context)),
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
            Padding(
              padding: EdgeInsets.only(
                  left: getWidth(20, context), right: getWidth(10, context)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProductCard(
                        author: 'Oguz Atay',
                        image: 'assets/images/atay.png',
                        price: '10 AZN',
                        title: 'Tutunamayanlar'),
                    ProductCard(
                        author: 'Oguz Atay',
                        image: 'assets/images/atay.png',
                        price: '10 AZN',
                        title: 'Tutunamayanlar'),
                    ProductCard(
                        author: 'Oguz Atay',
                        image: 'assets/images/atay.png',
                        price: '10 AZN',
                        title: 'Tutunamayanlar'),
                  ],
                ),
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
            Padding(
              padding: EdgeInsets.only(
                  left: getWidth(20, context), right: getWidth(10, context)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProductCard(
                        author: 'Oguz Atay',
                        image: 'assets/images/atay.png',
                        price: '10 AZN',
                        title: 'Tutunamayanlar'),
                    ProductCard(
                        author: 'Oguz Atay',
                        image: 'assets/images/atay.png',
                        price: '10 AZN',
                        title: 'Tutunamayanlar'),
                    ProductCard(
                        author: 'Oguz Atay',
                        image: 'assets/images/atay.png',
                        price: '10 AZN',
                        title: 'Tutunamayanlar'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
