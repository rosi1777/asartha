import 'package:asartha/common/style.dart';
import 'package:asartha/provider/auth_provider.dart';
import 'package:asartha/ui/forgot_password_page.dart';
import 'package:asartha/ui/partner/partner_sign_in_page.dart';
import 'package:asartha/ui/user/sign_up_page.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const routeName = '/sign_in_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    bool partner = false;
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: Scaffold(
        body: Consumer<AuthProvider>(
          builder: (context, auth, _) {
            if (auth.state == ResultState.loading) {
              return SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: _signInPage(context, size, partner),
                    ),
                  ],
                ),
              );
            } else if (auth.state == ResultState.error) {
              return _signInPage(context, size, partner);
            } else {
              return _signInPage(context, size, partner);
            }
          },
        ),
      ),
    );
  }

  SingleChildScrollView _signInPage(
      BuildContext context, Size size, bool partner) {
    return SingleChildScrollView(
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
                    key: const ValueKey('UserEmailInputField'),
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
                      bottom: BorderSide(color: secondary, width: 2),
                    ),
                  ),
                  height: 60.0,
                  child: TextField(
                    key: const ValueKey('UserPasswordInputField'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    style: input,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.only(top: 14.0, bottom: 8),
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
                      key: const ValueKey('UserSignInButton'),
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        Provider.of<AuthProvider>(context, listen: false)
                            .userSignIn(email, password, context, partner);
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
                      key: const ValueKey('SignInAsPartner'),
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
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
