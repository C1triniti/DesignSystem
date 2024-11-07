import 'package:flutter/material.dart';
import 'package:flutter_application_1/scenes/login/login_page_factory.dart';
import 'profile_page_factory.dart';

class ProfileRouter {
  static void goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePageFactory.create()),
    );
  }

  static void goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFactory.create()),
    );
  }
}