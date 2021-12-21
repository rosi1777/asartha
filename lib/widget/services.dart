import 'package:asartha/common/style.dart';
import 'package:asartha/ui/baby_sitter_date_picker_page.dart';
import 'package:asartha/ui/date_picker_page.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Layanan',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, DatePickerPage.routeName);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            margin: const EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/art.png'),
                Text(
                  'Asisten Rumah Tangga',
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, BabySitterDatePickerPage.routeName);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            margin: const EdgeInsets.only(bottom: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/babysitter.png')),
                Text(
                  'Babysitter',
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
