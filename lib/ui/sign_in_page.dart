import 'package:asartha/common/style.dart';
import 'package:asartha/ui/forgot_password_page.dart';
import 'package:asartha/ui/home_page.dart';
import 'package:asartha/ui/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const routeName = '/sign_in_page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 46,
                right: 46,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Selamat datang kembali',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: secondary, width: 2))),
                    height: 60.0,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.email,
                          color: grey,
                        ),
                        hintText: 'Alamat Email',
                        hintStyle: textHint,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: secondary, width: 2))),
                    height: 60.0,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      style: input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: grey,
                        ),
                        hintText: 'Password',
                        hintStyle: textHint,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgotPasswordPage.routeName);
                        },
                        child: Text(
                          'Lupa Password?',
                          style: Theme.of(context).textTheme.bodyText2,
                        )),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  SizedBox(
                    width: size.width,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            'Sign Up',
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, HomePage.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: secondary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20)),
                        )),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpPage.routeName);
                          },
                          child: Text('Sign Up',
                              style: Theme.of(context).textTheme.bodyText2))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
