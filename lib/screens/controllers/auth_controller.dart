import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocer_client/api/auth.dart';

class AuthController extends GetxController {
  AuthController() {
    emailController.addListener(handleEmail);
    passwordController.addListener(handlePassword);
    nameController.addListener(handleName);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;
  RxBool passwordVisible = false.obs;
  RxBool isValidCredentials = false.obs;

  void handleLogin() async {}
  void handleName() {
    name.value = nameController.value.text;
  }

  void handleEmail() {
    email.value = emailController.value.text;
  }

  void handlePassword() {
    password.value = passwordController.value.text;
    checkCredentials();
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
    checkCredentials();
  }

  void checkCredentials() {
    if (password.value.length > 7 && GetUtils.isEmail(email.value)) {
      isValidCredentials.value = true;
    } else {
      isValidCredentials.value = false;
    }
  }
}
