import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:kitab_qurdu/size.dart';
import 'package:kitab_qurdu/widgets/product_card.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(20, context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(18, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.settings_outlined),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pushNamed(context, '/setting');
                      },
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.telegram_outlined),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(15, context),
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(
              height: getHeight(7, context),
            ),
            Text(
              user.displayName!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getHeight(20, context),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(25, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text('100', style: TextStyle(fontSize: 20)),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text('20', style: TextStyle(fontSize: 20)),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text('10', style: TextStyle(fontSize: 20)),
                      Text(
                        'Sales',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(20, context),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getWidth(20, context)),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  childAspectRatio: 0.65,
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
            )
          ],
        ),
      ),
    );
  }
}
