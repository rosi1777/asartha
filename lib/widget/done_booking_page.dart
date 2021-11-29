import 'package:asartha/common/style.dart';
import 'package:asartha/widget/done_booking_card.dart';
import 'package:flutter/material.dart';

class DoneBookingPage extends StatelessWidget {
  const DoneBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: Container(
        height: 277,
        margin: const EdgeInsets.only(top: 25, left: 26, right: 26),
        child: const DoneBookingCard(),
      ),
    );
  }
}