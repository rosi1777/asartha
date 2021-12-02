import 'package:asartha/common/style.dart';
import 'package:asartha/widget/done_booking_card.dart';
import 'package:asartha/widget/job.dart';
import 'package:asartha/widget/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool partner;

  const HomePage({Key? key, required this.partner}) : super(key: key);
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
                      'Recent',
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
                partner ? const Jobs() : const Services()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
