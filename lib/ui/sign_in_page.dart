import 'package:asartha/common/style.dart';
import 'package:asartha/ui/forgot_password_page.dart';
import 'package:asartha/ui/partner_sign_in_page.dart';
import 'package:asartha/ui/sign_up_page.dart';
import 'package:asartha/widget/floating_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const routeName = '/sign_in_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    bool partner = false;
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
                            Icons.email_outlined,
                            color: grey,
                            size: 27,
                          ),
                          hintText: 'Alamat Email',
                          hintStyle: textHint,
                        ),
                        controller: _emailController,
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
                        obscureText: _obscureText,
                        style: input,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: grey,
                            size: 30,
                          ),
                          suffix: IconButton(
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          hintText: 'Password',
                          hintStyle: textHint,
                        ),
                        controller: _passwordController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgotPasswordPage.routeName);
                        },
                        child: Text(
                          'Lupa Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            'Sign In',
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () async {
                            try {
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              Navigator.pushReplacementNamed(
                                  context, FloatingNavigationBar.routeName,
                                  arguments: partner);
                            } catch (e) {
                              final snackBar = SnackBar(
                                content: Text(e.toString()),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: secondary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                          ),
                        ),
                      ),
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
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'atau',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, PartnerSignInPage.routeName);
                          },
                          child: Text(
                            'Sign In sebagai Partner',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: primary,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
