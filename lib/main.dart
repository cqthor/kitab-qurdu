import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kitab_qurdu/color.dart';
import 'package:kitab_qurdu/provider/google_sign_in.dart';
import 'package:kitab_qurdu/routes.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Kitab Qurdu',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'PT Sans',
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
            prefixIconColor: kInputColor,
            suffixIconColor: kInputColor,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: kInputColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: kInputColor)),
          ),
        ),
        initialRoute: '/auth',
        routes: routes,
      ),
    );
  }
}
