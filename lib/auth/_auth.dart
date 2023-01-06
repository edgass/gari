
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'login.dart';
import 'otp.dart';
class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return GetBuilder<AuthController>(
        builder: (value)=>value.authState == AuthState.codeSent ? const Otp() : const Login());
  }
}
