import 'package:kitab_qurdu/screens/detail/detail.dart';
import 'package:kitab_qurdu/screens/home/home_page.dart';
import 'package:kitab_qurdu/screens/login_signup/auth.dart';
import 'package:kitab_qurdu/screens/login_signup/login.dart';
import 'package:kitab_qurdu/screens/login_signup/signup.dart';

import 'screens/account_page.dart/setting.dart';
import 'screens/home/categories/categories.dart';

var routes = {
  '/': (context) => const HomePage(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
  '/detail': (context) => const BookDetailPage(),
  '/auth': (context) => const GoogleLoginCheck(),
  '/categories': (context) => const Categories(),
  '/setting': (context) => const SettingPage(),
};
