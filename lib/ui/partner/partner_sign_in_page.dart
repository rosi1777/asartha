import 'package:asartha/common/style.dart';
import 'package:asartha/provider/auth_provider.dart';
import 'package:asartha/ui/forgot_password_page.dart';
import 'package:asartha/ui/partner/partner_sign_up_page.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartnerSignInPage extends StatefulWidget {
  const PartnerSignInPage({Key? key}) : super(key: key);
  static const routeName = '/partner_sign_in_page';

  @override
  State<PartnerSignInPage> createState() => _PartnerSignInPageState();
}

class _PartnerSignInPageState extends State<PartnerSignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    bool partner = true;
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
                      child: _partnerSignIn(context, partner),
                    ),
                  ],
                ),
              );
            } else if (auth.state == ResultState.error) {
              return SafeArea(
                child: _partnerSignIn(context, partner),
              );
            } else {
              return SafeArea(
                child: _partnerSignIn(context, partner),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _partnerSignIn(BuildContext context, bool partner) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: black,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          const SizedBox(
            height: 16,
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
                  'Sign in sebagai Partner',
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
                    key: const ValueKey('PartnerEmailInputField'),
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
                    key: const ValueKey('PartnerPasswordInputField'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    style: input,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        top: 14.0,
                        bottom: 8,
                      ),
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
                      key: const ValueKey('PartnerSignInButton'),
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        Provider.of<AuthProvider>(context, listen: false)
                            .partnerSignIn(email, password, context, partner);
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
                        Navigator.pushNamed(
                            context, PartnerSignUpPage.routeName);
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
