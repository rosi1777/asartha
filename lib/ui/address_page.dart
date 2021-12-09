import 'package:asartha/common/style.dart';
import 'package:asartha/provider/address_provider.dart';
import 'package:asartha/ui/add_address_page.dart';
import 'package:asartha/ui/detail_address_page.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatelessWidget {
  final bool partner;
  const AddressPage({Key? key, required this.partner}) : super(key: key);
  static const routeName = '/address_page';

  Widget _buildAddress() {
    return Consumer<AddressProvider>(
      builder: (context, provider, _) {
        if (provider.state == ResultState.loading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 25),
              Text(
                'Memuat Alamat...',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          );
        } else if (provider.state == ResultState.error) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              Text(
                'Belum Ada Data',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 21,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    child: Text(
                      'Tambah Alamat',
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AddAddressPage.routeName,
                          arguments: partner);
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
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(21),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alamat ${provider.address.addressOf}',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w600, color: black),
                ),
                Text(
                  provider.address.name,
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
                Text(
                  provider.address.address,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                      child: Text(
                        'Ubah Alamat',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, DetailAddressPage.routeName,
                            arguments: partner);
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
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final id = _auth.currentUser?.uid;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Alamat',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: snow,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ChangeNotifierProvider(
                  create: (_) => AddressProvider(id!, partner),
                  child: _buildAddress(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
