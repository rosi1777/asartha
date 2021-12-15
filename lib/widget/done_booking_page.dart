import 'package:asartha/common/style.dart';
import 'package:asartha/widget/done_booking_card.dart';
import 'package:flutter/material.dart';

class DoneBookingPage extends StatelessWidget {
  final bool partner;
  const DoneBookingPage({Key? key, required this.partner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: DoneBookingCard(
        partner: partner,
      ),
    );
  }
}
