import 'package:flutter/material.dart';
import 'package:kitab_qurdu/color.dart';
import 'package:kitab_qurdu/size.dart';

class LoginSwitchButton extends StatelessWidget {
  const LoginSwitchButton({
    Key? key,
    this.isLogin = true,
  }) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: getHeight(60, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            width: (screenWidth - getWidth(40, context)) / 2,
            padding: const EdgeInsets.all(8),
            child: TextButton(
                onPressed: isLogin
                    ? null
                    : () {
                        Navigator.pushNamed(context, '/login');
                      },
                style: TextButton.styleFrom(
                  backgroundColor: isLogin ? kPrimaryColor : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: isLogin ? Colors.white : Colors.black,
                      fontSize: getHeight(18, context),
                      fontWeight: FontWeight.w500),
                )),
          ),
          Container(
            width: (screenWidth - getWidth(40, context)) / 2,
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: isLogin
                  ? () {
                      Navigator.pushNamed(context, '/signup');
                    }
                  : null,
              style: TextButton.styleFrom(
                backgroundColor: isLogin ? Colors.white : kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                    color: isLogin ? Colors.black : Colors.white,
                    fontSize: getHeight(18, context),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
