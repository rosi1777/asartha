import 'package:asartha/common/style.dart';
import 'package:asartha/data/database/auth_helper.dart';
import 'package:flutter/material.dart';

class PartnerSignUpPage extends StatefulWidget {
  const PartnerSignUpPage({Key? key}) : super(key: key);
  static const routeName = '/partner_sign_up_page';

  @override
  State<PartnerSignUpPage> createState() => _PartnerSignUpPageState();
}

class _PartnerSignUpPageState extends State<PartnerSignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final List<String> role = ['Asisten Rumah Tangga', 'Babysitter'];
  String _currentRole = 'Asisten Rumah Tangga';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    print(_currentRole);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                      'Sign up sebagai Partner',
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
                      height: 10,
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
                      height: 10,
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
                      height: 10,
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
                          controller: _emailController),
                    ),
                    const SizedBox(
                      height: 10,
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
                      height: 26,
                    ),
                    Text(
                      'Role',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: secondary, width: 2),
                          ),
                        ),
                        height: 60.0,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          value: _currentRole,
                          items: role.map((role) {
                            return DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _currentRole = val as String),
                        )),
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
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                final name = _nameController.text;
                                final phoneNumber = _phoneNumberController.text;
                                final role = _currentRole;
                                AuthHelper().partnerRegister(
                                    email,
                                    password,
                                    name,
                                    int.parse(phoneNumber),
                                    role,
                                    context);
                              } catch (e) {
                                final snackBar = SnackBar(
                                  content: Text(e.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } finally {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                              // Navigator.pushNamed(
                              //     context, FloatingNavigationBar.routeName,
                              //     arguments: partner);
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
