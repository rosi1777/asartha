import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcessBookingPage extends StatelessWidget {
  const ProcessBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, left: 26, right: 26),
              padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#21177',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        width: 83,
                        height: 27,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[100]),
                        child: Center(
                          child: Text(
                            'Diterima',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asisten Rumah Tangga',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '22 Sep 21, 08 : 00 - 14 : 00',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Text(
                        'Rp. 177.000',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Divider(
                    color: grey,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fathorrosi',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            'Asisten Rumah Tangga',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('assets/images/user.jpg',
                            width: 35, height: 35, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, left: 26, right: 26),
              padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#21177',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Container(
                        width: 83,
                        height: 27,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[100]),
                        child: Center(
                          child: Text('Dikirim',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asisten Rumah Tangga',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            '22 Sep 21, 08 : 00 - 14 : 00',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Text(
                        'Rp. 177.000',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: ElevatedButton(
                        child: Text(
                          'Batalkan',
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
