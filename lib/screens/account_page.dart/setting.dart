import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kitab_qurdu/size.dart';
import 'package:provider/provider.dart';

import '../../color.dart';
import '../../provider/google_sign_in.dart';
import '../../widgets/setting_page_cards.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
  });

  @override
  State<SettingPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getHeight(20, context),
              ),
              SizedBox(
                width: getWidth(350, context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Settings     ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Visibility(
                      visible: false,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(20, context)),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(height: getHeight(30, context)),
              SettingCards(
                icon: const Icon(Icons.person),
                title: 'Username',
                onTap: () {},
              ),
              SizedBox(height: getHeight(25, context)),
              SettingCards(
                icon: const Icon(Icons.alternate_email_outlined),
                title: 'Email, phone',
                onTap: () {},
              ),
              SizedBox(height: getHeight(25, context)),
              SettingCards(
                icon: const Icon(Icons.wallet),
                title: 'My Wallet',
                onTap: () {},
              ),
              SizedBox(height: getHeight(25, context)),
              SettingCards(
                icon: const Icon(Icons.shopping_cart_checkout),
                title: 'What I bought or sold',
                onTap: () {},
              ),
              SizedBox(height: getHeight(25, context)),
              SettingCards(
                icon: const Icon(Icons.notifications_none_sharp),
                title: 'Notifications',
                onTap: () {},
              ),
              SizedBox(height: getHeight(25, context)),
              SettingCards(
                icon: const Icon(Icons.delete_outline_outlined),
                title: 'Delete account',
                onTap: () {},
              ),
              SizedBox(height: getHeight(25, context)),
              SettingCards(
                icon: const Icon(Icons.logout),
                title: 'Log out',
                onTap: () {
                  // final provider =
                  //     Provider.of<GoogleSignInProvider>(context, listen: false);
                  // provider.logout();

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: kPrimaryColor,
                            ),
                            onPressed: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.logout();

                              Navigator.of(context).pop();
                            },
                            child: const Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No')),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
