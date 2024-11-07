import 'package:flutter/material.dart';
import 'package:flutter_application_1/scenes/profile/profile_page_factory.dart';
import 'login_page_factory.dart';

class LoginRouter {
  static void goToLoginPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => LoginPageFactory.create()),
    );
  }

  static void goToProfilePage(BuildContext context, Map<String, dynamic> userData) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => ProfilePageFactory.create()),
    );
  }
}
