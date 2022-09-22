import 'package:flutter/material.dart';
import 'package:kitab_qurdu/color.dart';
import 'package:kitab_qurdu/screens/login_signup/login_switch_button.dart';
import 'package:kitab_qurdu/size.dart';
import 'package:kitab_qurdu/widgets/custom_divider.dart';
import 'package:provider/provider.dart';

import '../../provider/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: screenHeight,
            padding: EdgeInsets.symmetric(horizontal: getWidth(20, context)),
            // width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getHeight(44, context)),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: getHeight(36, context),
                      )),
                ),
                SizedBox(height: getHeight(20, context)),
                const LoginSwitchButton(),
                SizedBox(height: getHeight(20, context)),
                const Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500), //TODO: change to size
                ),
                SizedBox(height: getHeight(10, context)),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Username, email or phone",
                    hintStyle: TextStyle(
                        color: kInputColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: getHeight(20, context)),
                const Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500), //TODO: change to size
                ),
                SizedBox(height: getHeight(10, context)),
                TextFormField(
                  obscureText: !_passwordVisible,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => _passwordVisible = !_passwordVisible,
                      ),
                      child: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                        color: kInputColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: kInputColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getHeight(30, context)),
                SizedBox(
                  width: double.infinity,
                  height: getHeight(50, context),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    CustomDivider(
                        width: (screenWidth - 60 - getWidth(40, context)) / 2),
                    const SizedBox(width: 20),
                    const SizedBox(width: 20, child: Text("Or")),
                    const SizedBox(width: 20),
                    CustomDivider(
                        width: (screenWidth - 60 - getWidth(40, context)) / 2),
                  ],
                ),
                SizedBox(height: getHeight(20, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage("assets/social_auth/apple.png"),
                      ),
                    ),
                    SizedBox(width: getWidth(18, context)),
                    IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage("assets/social_auth/facebook.png"),
                      ),
                    ),
                    SizedBox(width: getWidth(18, context)),
                    IconButton(
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                        //   AuthService().signInWithGoogle();
                      },
                      icon: const Image(
                        image: AssetImage("assets/social_auth/google.png"),
                      ),
                    )
                  ],
                ),
                SizedBox(height: getHeight(64, context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
