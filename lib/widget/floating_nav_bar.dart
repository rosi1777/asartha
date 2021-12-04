import 'package:asartha/common/style.dart';
import 'package:asartha/ui/booking_page.dart';
import 'package:asartha/ui/chat_page.dart';
import 'package:asartha/ui/home_page.dart';
import 'package:asartha/ui/profile_page.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';

class FloatingNavigationBar extends StatelessWidget {
  final bool partner;

  const FloatingNavigationBar({Key? key, required this.partner})
      : super(key: key);
  static const routeName = "/nav_bar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingNavBar(
        color: white,
        items: [
          FloatingNavBarItem(
            iconData: Icons.home,
            title: 'Home',
            page: HomePage(
              partner: partner,
            ),
          ),
          FloatingNavBarItem(
            iconData: Icons.shopping_cart,
            title: 'Booking',
            page: BookingPage(partner: partner),
          ),
          FloatingNavBarItem(
            iconData: Icons.message,
            title: 'Chat',
            page: const ChatPage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.person,
            title: 'Profile',
            page: const ProfilePage(),
          )
        ],
        selectedIconColor: primary,
        unselectedIconColor: grey,
        hapticFeedback: true,
        horizontalPadding: 30,
      ),
    );
  }
}
