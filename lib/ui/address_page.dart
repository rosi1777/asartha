import 'package:asartha/common/style.dart';
import 'package:asartha/ui/detail_address_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);
  static const routeName = '/address_page';

  @override
  Widget build(BuildContext context) {
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
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, DetailAddressPage.routeName);
                      },
                      child: Text(
                        'Tambah Alamat',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: secondary),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat Rumah',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: black),
                      ),
                      Text(
                        'Fathorrosi',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Text(
                        'Dusun Krajan Rt. 001 Rw. 002 Desa Gondosuli',
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
                                  context, DetailAddressPage.routeName);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
