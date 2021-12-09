import 'package:asartha/common/style.dart';
import 'package:asartha/data/database/partner_firestroe_helper.dart';
import 'package:asartha/data/database/user_firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAddressPage extends StatefulWidget {
  final bool partner;
  const AddAddressPage({Key? key, required this.partner}) : super(key: key);
  static const routeName = '/add_address_page';

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _addressOf = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _postCode = TextEditingController();
  final _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _id = _auth.currentUser?.uid;
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 34,
                    ),
                    Text(
                      'Tambah Alamat',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: black),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Simpan alamat sebagai (contoh: alamat rumah)',
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
                            keyboardType: TextInputType.name,
                            style: input,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            controller: _addressOf),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Nama Penerima',
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
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _name,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat',
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
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _address,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Kota atau Kecamatan',
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
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _city,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Kode Pos',
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
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _postCode,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nomer Telepon Penerima',
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
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _phone,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                      child: Text(
                        'Tambah',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () async {
                        try {
                          final addressOf = _addressOf.text;
                          final id = _id;
                          final name = _name.text;
                          final address = _address.text;
                          final city = _city.text;
                          final postCode = _postCode.text;
                          final phone = _phone.text;

                          widget.partner
                              ? await PartnerFirestoreHelper().addAddressData(
                                  addressOf,
                                  id!,
                                  name,
                                  address,
                                  city,
                                  int.parse(postCode),
                                  int.parse(phone))
                              : await UserFirestoreHelper().addAddressData(
                                  addressOf,
                                  id!,
                                  name,
                                  address,
                                  city,
                                  int.parse(postCode),
                                  int.parse(phone));
                          Navigator.pop(context);
                        } catch (e) {
                          final snackBar = SnackBar(
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addressOf.dispose();
    _name.dispose();
    _address.dispose();
    _city.dispose();
    _postCode.dispose();
    _phone.dispose();
    super.dispose();
  }
}
