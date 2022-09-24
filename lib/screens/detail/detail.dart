import 'package:flutter/material.dart';
import 'package:kitab_qurdu/size.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const MyImages(image: 'assets/images/atay.png'),
    const MyImages(image: 'assets/images/book2.jfif'),
    const MyImages(image: 'assets/images/atay.png'),
  ];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: getHeight(70, context)),
              Stack(
                children: [
                  SizedBox(
                    height: getHeight(360, context),
                    // width: double.infinity,
                    child: PageView(
                      controller: _pageController,
                      children: _pages,
                      onPageChanged: (index) {
                        setState(() {
                          count = index;
                        });
                      },
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 52,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 150,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: getHeight(10, context),
                          width: getWidth(10, context),
                          decoration: BoxDecoration(
                            color: count == 0 ? Colors.white : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: getHeight(10, context),
                          width: getWidth(10, context),
                          decoration: BoxDecoration(
                            color: count == 1 ? Colors.white : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: getHeight(10, context),
                          width: getWidth(10, context),
                          decoration: BoxDecoration(
                            color: count == 2 ? Colors.white : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(25, context)),
              SizedBox(
                width: getWidth(330, context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tutunamayanlar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: getHeight(5, context)),
                        const Text(
                          'Oguz Atay',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(
                        Icons.upload_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(20, context)),
              SizedBox(
                width: getWidth(330, context),
                child: const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              SizedBox(height: getHeight(25, context)),
              SizedBox(
                width: getWidth(330, context),
                child: Row(
                  children: [
                    Container(
                      height: getHeight(13, context),
                      width: getWidth(13, context),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: getWidth(10, context)),
                    const Text('Good'),
                  ],
                ),
              ),
              SizedBox(height: getHeight(25, context)),
              SizedBox(
                width: getWidth(330, context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyImages extends StatelessWidget {
  const MyImages({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(50, context)),
      child: Container(
        height: getHeight(350, context),
        // width: getHeight(320, context),

        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
