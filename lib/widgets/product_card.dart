import 'package:flutter/material.dart';
import 'package:kitab_qurdu/size.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.price,
  });
  final String title;
  final String author;
  final String image;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: getHeight(270, context),
        width: getWidth(160, context),
        child: Stack(
          children: [
            Container(
              height: getHeight(220, context),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(9),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(10, context),
                  vertical: getHeight(10, context),
                ),
                height: getHeight(100, context),
                width: getWidth(160, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      author,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 8,
              child: Image.asset('assets/images/favorite.png'),
            ),
          ],
        ),
      ),
    );
  }
}
