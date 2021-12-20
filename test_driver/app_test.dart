import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart' as test;
import 'package:test/test.dart';

void main() {
  final userEmailField = find.byValueKey('UserEmailInputField');
  final userPasswordField = find.byValueKey('UserPasswordInputField');
  final userSignInButton = find.byValueKey('UserSignInButton');
  final signInAsPartner = find.byValueKey('SignInAsPartner');

  //nav bar
  final navigationBar = find.byValueKey('FloatingNavBar');
  final profileNotifier = find.byValueKey('ProfileNotifier');

  //LogOut
  final profileLogoutButton = find.byValueKey('ProfileLogoutButton');
  final logoutButton = find.byValueKey('logoutButton');

  //user sign up
  final partnerEmailField = find.byValueKey('PartnerEmailInputField');
  final partnerPasswordField = find.byValueKey('PartnerPasswordInputField');
  final partnerSignInButton = find.byValueKey('PartnerSignInButton');

  late FlutterDriver driver;
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  test('User Sign In Test', () async {
    await driver.tap(userEmailField);
    await driver.enterText('bhisma@gmail.com');

    await driver.tap(userPasswordField);
    await driver.enterText('123456');

    await driver.tap(userSignInButton);
    await driver.waitFor(find.text('Dashboard'));

    // TODO: Adding integration to go from home to profile navigation bar
    // TODO: Adding tap logiot text
    // TODO: Adding tap confirm logout
  });

  test('Partner Sign In Test', () async {
    await driver.tap(signInAsPartner);
    await driver.waitFor(find.text('Sign in sebagai Partner'));

    await driver.tap(partnerEmailField);
    await driver.enterText('firstpartner@gmail.com');

    await driver.tap(partnerPasswordField);
    await driver.enterText('123456');

    await driver.tap(partnerSignInButton);
    await driver.waitFor(find.text('Dashboard'));
  });
}
