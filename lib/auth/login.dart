import 'package:flutter/material.dart';
import 'package:gari/auth/footer.dart';
import 'package:gari/auth/form.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(),
              LoginForm(),
              LoginFooter()
            ],
          ),
        ),
      ),
    );
  }
}
