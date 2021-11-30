import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailAddressPage extends StatelessWidget {
  const DetailAddressPage({Key? key}) : super(key: key);
  static const routeName = '/detail_address_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: snow,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 26, right: 26, top: 26),
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
                        Container(
                          padding: const EdgeInsets.all(21),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white),
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
                                    bottom:
                                        BorderSide(color: secondary, width: 2),
                                  ),
                                ),
                                height: 40.0,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Rumah',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2),
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
                                    bottom:
                                        BorderSide(color: secondary, width: 2),
                                  ),
                                ),
                                height: 40.0,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Fathorrosi',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2),
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
                              borderRadius: BorderRadius.circular(10),
                              color: white),
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
                                    bottom:
                                        BorderSide(color: secondary, width: 2),
                                  ),
                                ),
                                height: 40.0,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          'Desa Gondosuli, Dusun Krajan, kec. Pakuniran',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2),
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
                                    bottom:
                                        BorderSide(color: secondary, width: 2),
                                  ),
                                ),
                                height: 40.0,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          'Jawa Timur, Kab. Probolinggo, Pakuniran',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2),
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
                                    bottom:
                                        BorderSide(color: secondary, width: 2),
                                  ),
                                ),
                                height: 40.0,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '682122',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2),
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
                              borderRadius: BorderRadius.circular(10),
                              color: white),
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
                                    bottom:
                                        BorderSide(color: secondary, width: 2),
                                  ),
                                ),
                                height: 40.0,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '081238657974',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headline2),
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
                                  'Simpan',
                                  style: Theme.of(context).textTheme.button,
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: secondary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20)),
                              )),
                        ),
                      ],
                    )))));
  }
}
