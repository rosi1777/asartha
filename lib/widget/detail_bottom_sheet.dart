import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';

class DetailBottomSheet extends StatelessWidget {
  const DetailBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 35),
      height: 562,
      width: MediaQuery.of(context).size.width,
      color: white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Detail',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 37,
        ),
        Text(
          'Customer',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Fathorrosi',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Alamat',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Dusun Krajan Rt. 001 Rw. 002 Desa Gondosuli',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Layanan',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Asisten Rumah Tangga',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Tanggal dan Jam',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          '22 Sep 21, 08:00 - 14:00',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Petugas',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Fathorrosi',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Total',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Rp. 177.000',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 21,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: ElevatedButton(
                child: Text(
                  'Close',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20)),
              )),
        ),
      ]),
    );
  }
}
