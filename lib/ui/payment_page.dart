import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum SingingCharacter { link, dana, tunai }

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);
  static const routeName = '/payment_page';

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  SingingCharacter? _character = SingingCharacter.link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 26, right: 26),
                child: Row(
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
                      'Metode Pembayaran',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: snow,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 26, right: 26, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(color: secondary, width: 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/link.png'),
                    Text(
                      'Link Aja',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Radio<SingingCharacter>(
                        value: SingingCharacter.link,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 26, right: 26, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(color: secondary, width: 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/dana.png'),
                    Text(
                      'Dana',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Radio<SingingCharacter>(
                        value: SingingCharacter.dana,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 26, right: 26, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(color: secondary, width: 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/dollar.png'),
                    Text(
                      'Bayar tunai',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Radio<SingingCharacter>(
                        value: SingingCharacter.tunai,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 213,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 34, right: 34, top: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Detail Pesanan',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: black)),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Layanan',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            'Asisten Rumah Tangga',
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            'Rp. 177.000',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: black),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: ElevatedButton(
                              child: Text(
                                'Bayar Sekarang',
                                style: Theme.of(context).textTheme.button,
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: secondary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20)),
                            )),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
