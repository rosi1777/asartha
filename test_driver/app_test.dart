import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart' as test;
import 'package:test/test.dart';

void main() {
  final userEmailField = find.byValueKey('UserEmailInputField');
  final userPasswordField = find.byValueKey('UserPasswordInputField');
  final userSignInButton = find.byValueKey('UserSignInButton');
  final signInAsPartner = find.byValueKey('SignInAsPartner');

  //LogOut
  final userProfileLogoutButton = find.byValueKey('ProfileLogoutButton');
  final userLogoutButton = find.byValueKey('LogoutButton');

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

  test('User Sign In', () async {
    await driver.tap(userEmailField);
    await driver.enterText('bhisma@gmail.com');

    await driver.tap(userPasswordField);
    await driver.enterText('123456');

    await driver.tap(userSignInButton);
    await driver.waitFor(find.text('Dashboard'));
  });
  
  test('Log Out Test', () async {
    await driver.scrollUntilVisible(
        find.text('Dashboard'), find.text('Pemesanan'),
        dxScroll: -300);
    await driver.scrollUntilVisible(find.text('Pemesanan'), find.text('Pesan'),
        dxScroll: -400);
    await driver.scrollUntilVisible(find.text('Pesan'), userProfileLogoutButton,
        dxScroll: -400);

    await driver.tap(userProfileLogoutButton);

    await driver.tap(userLogoutButton);
    await driver.waitFor(find.text('Sign In'));
  });

  test('Partner Sign In and Log Out Test', () async {
    await driver.tap(signInAsPartner);
    await driver.waitFor(find.text('Sign in sebagai Partner'));

    await driver.tap(partnerEmailField);
    await driver.enterText('firstpartner@gmail.com');

    await driver.tap(partnerPasswordField);
    await driver.enterText('123456');

    await driver.tap(partnerSignInButton);
    await driver.waitFor(find.text('Dashboard'));

    await driver.scrollUntilVisible(
        find.text('Dashboard'), find.text('Pekerjaan'),
        dxScroll: -300);
    await driver.scrollUntilVisible(find.text('Pekerjaan'), find.text('Pesan'),
        dxScroll: -400);
    await driver.scrollUntilVisible(find.text('Pesan'), find.text('Logout'),
        dxScroll: -400);

    await driver.tap(find.text('Logout'));

    await driver.tap(find.text('Ya, Keluar'));
    await driver.waitFor(find.text('Sign In'));
  });
}
