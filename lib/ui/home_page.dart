import 'package:asartha/common/style.dart';
import 'package:asartha/ui/payment_page.dart';
import 'package:asartha/widget/done_booking_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/user.jpg',
                          width: 38, height: 38, fit: BoxFit.cover),
                    ),
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                      iconSize: 30,
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Racent',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
                const DoneBookingCard(),
                const SizedBox(
                  height: 19,
                ),
                Text(
                  'Layanan',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PaymentPage.routeName);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: white),
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
                GestureDetector(
                  onTap: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}
