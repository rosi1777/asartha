import 'package:asartha/common/style.dart';
import 'package:asartha/provider/auth_provider.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const routeName = '/sign_up_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Scaffold(
        body: Consumer<AuthProvider>(builder: (context, auth, _) {
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
                    child: _userSignUp(context),
                  ),
                ],
              ),
            );
          } else {
            return _userSignUp(context);
          }
        }),
      ),
    );
  }

  SafeArea _userSignUp(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
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
                    'Sign up',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Buat akun disini',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 46,
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
                      keyboardType: TextInputType.name,
                      style: input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.person,
                          color: grey,
                        ),
                        hintText: 'Nama',
                        hintStyle: textHint,
                      ),
                      controller: _nameController,
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
                      keyboardType: TextInputType.number,
                      style: input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: grey,
                        ),
                        hintText: 'Nomer Telepon',
                        hintStyle: textHint,
                      ),
                      controller: _phoneNumberController,
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
                      controller: _passwordController,
                    ),
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
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          final name = _nameController.text;
                          final phoneNumber = _phoneNumberController.text;
                          Provider.of<AuthProvider>(context, listen: false)
                              .userRegister(email, password, name,
                                  int.parse(phoneNumber), context);
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
                        'Sudah punya akun?',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: black,
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
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
