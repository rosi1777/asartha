import 'package:asartha/common/style.dart';
import 'package:asartha/provider/partner_provider.dart';
import 'package:asartha/provider/user_provider.dart';
import 'package:asartha/ui/booking_page.dart';
import 'package:asartha/ui/chat_page.dart';
import 'package:asartha/ui/home_page.dart';
import 'package:asartha/ui/partner/partner_profile_page.dart';
import 'package:asartha/ui/user/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingNavigationBar extends StatefulWidget {
  final bool partner;

  const FloatingNavigationBar({Key? key, required this.partner})
      : super(key: key);
  static const routeName = "/nav_bar";

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  final _auth = FirebaseAuth.instance;
  late User _activeUser;
  late String _id;

  void _getCurrentUser() {
    try {
      var currentUser = _auth.currentUser;
      if (currentUser != null) {
        _id = currentUser.uid;
        _activeUser = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

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
              partner: widget.partner,
            ),
          ),
          FloatingNavBarItem(
            iconData: Icons.shopping_cart,
            title: 'Booking',
            page: BookingPage(partner: widget.partner),
          ),
          FloatingNavBarItem(
            iconData: Icons.message,
            title: 'Chat',
            page: const ChatPage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.person,
            title: 'Profile',
            page: widget.partner
                ? ChangeNotifierProvider(
                    create: (_) => PartnerProfileProvider(_id),
                    child: const PartnerProfilePage(),
                  )
                : ChangeNotifierProvider(
                    create: (_) => UserProfileProvider(_id),
                    child: const ProfilePage(),
                  ),
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
