import 'package:flutter/material.dart';
import 'package:kitab_qurdu/color.dart';
import 'package:kitab_qurdu/size.dart';
import 'package:kitab_qurdu/widgets/custom_divider.dart';

import 'login_switch_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
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
                const LoginSwitchButton(
                  isLogin: false,
                ),
                SizedBox(height: getHeight(20, context)),
                const Text(
                  "Email or Phone",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500), //TODO: change to size
                ),
                SizedBox(height: getHeight(10, context)),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: "Email or phone",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: kInputColor,
                    ),
                  ),
                ),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Username",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: kInputColor,
                    ),
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
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: kInputColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: kInputColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: getHeight(50, context)),
                SizedBox(
                  width: screenWidth,
                  height: getHeight(50, context),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Sign Up'),
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
                      onPressed: () {},
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
