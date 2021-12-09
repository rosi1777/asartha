import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/partner_profile.dart';
import 'package:asartha/provider/partner_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartnerEditProfilePage extends StatefulWidget {
  static const routeName = '/partner_edit_profile_page';
  final PartnerProfile partner;
  const PartnerEditProfilePage({Key? key, required this.partner})
      : super(key: key);

  @override
  State<PartnerEditProfilePage> createState() => _PartnerEditProfilePageState();
}

class _PartnerEditProfilePageState extends State<PartnerEditProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.partner.email;
    _nameController.text = widget.partner.name;
    _phoneNumberController.text = '0${widget.partner.phoneNumber}';
  }

  @override
  Widget build(BuildContext context) {
    final id = _auth.currentUser?.uid;
    return ChangeNotifierProvider(
      create: (_) => PartnerProfileProvider(id!),
      builder: (context, _) {
        return Scaffold(
          backgroundColor: snow,
          appBar: AppBar(
            backgroundColor: snow,
            iconTheme: IconThemeData(color: black),
            centerTitle: true,
            title: Text(
              'Edit Profile',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: secondary, width: 2),
                          ),
                        ),
                        height: 40.0,
                        child: TextField(
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nama Lengkap',
                            hintStyle: TextStyle(color: hintText),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: secondary, width: 2),
                          ),
                        ),
                        height: 40.0,
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'contoh.email@gmail.com',
                            hintStyle: TextStyle(color: hintText),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Nomor Telepon',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: secondary, width: 2),
                          ),
                        ),
                        height: 40.0,
                        child: TextField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '081999888777',
                            hintStyle: TextStyle(color: hintText),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child: Text(
                            'Batal',
                            style: TextStyle(color: secondary),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: snow,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            side: BorderSide(
                              color: secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child: Text(
                            'Simpan',
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () async {
                            final id = _auth.currentUser?.uid;
                            final name = _nameController.text;
                            final email = _emailController.text;
                            final number =
                                int.parse(_phoneNumberController.text);
                            await Provider.of<PartnerProfileProvider>(context,
                                    listen: false)
                                .updatePartnerProfile(id!, name, email, number);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: secondary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
