import 'package:asartha/common/style.dart';
import 'package:asartha/ui/error_payment_page.dart';
import 'package:flutter/material.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({Key? key}) : super(key: key);
  static const routeName = '/success_payment_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/succes.png'),
                  const SizedBox(height: 51),
                  Text('Pembayaran Berhasil',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 62),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            'Kembali ke Beranda',
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ErrorPaymentPage.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: secondary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20)),
                        )),
                  ),
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
