import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/address.dart';
import 'package:asartha/provider/address_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailAddressPage extends StatefulWidget {
  final bool partner;
  final Address address;
  const DetailAddressPage(
      {Key? key, required this.partner, required this.address})
      : super(key: key);
  static const routeName = '/detail_address_page';

  @override
  State<DetailAddressPage> createState() => _DetailAddressPageState();
}

class _DetailAddressPageState extends State<DetailAddressPage> {
  final _addressOf = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _postCode = TextEditingController();
  final _phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addressOf.text = widget.address.addressOf;
    _name.text = widget.address.name;
    _address.text = widget.address.address;
    _city.text = widget.address.city;
    _postCode.text = widget.address.postCode;
    _phone.text = widget.address.phone;
  }

  Widget _buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  keyboardType: TextInputType.text,
                  style: input,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'rumah',
                      hintStyle: textHint),
                  controller: _addressOf,
                ),
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'nama',
                      hintStyle: textHint),
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Jl.Bungkarno no 5',
                      hintStyle: textHint),
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mataram',
                      hintStyle: textHint),
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '81111',
                      hintStyle: textHint),
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '081921827162',
                      hintStyle: textHint),
                  controller: _phone,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
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
                      'Detail Alamat',
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
                _buildAddress(),
                const SizedBox(
                  height: 25,
                ),
                ChangeNotifierProvider(
                    create: (_) => AddressProvider(_id!, widget.partner),
                    builder: (context, _) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: ElevatedButton(
                            child: Text(
                              'Simpan',
                              style: Theme.of(context).textTheme.button,
                            ),
                            onPressed: () async {
                              try {
                                final addressOf = _addressOf.text;
                                final id = _id;
                                final name = _name.text;
                                final address = _address.text;
                                final city = _city.text;
                                final postCode = int.parse(_postCode.text);
                                final phone = int.parse(_phone.text);

                                await Provider.of<AddressProvider>(context,
                                        listen: false)
                                    .updateAddress(
                                        addressOf,
                                        id!,
                                        name,
                                        address,
                                        city,
                                        postCode,
                                        phone,
                                        widget.partner);
                                Navigator.pop(context);
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
                      );
                    }),
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
