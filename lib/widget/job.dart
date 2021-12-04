import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';

class Jobs extends StatelessWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lowogan',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#21177',
                style: Theme.of(context).textTheme.headline5,
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
                      'Ambil',
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: secondary,
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
    );
  }
}
