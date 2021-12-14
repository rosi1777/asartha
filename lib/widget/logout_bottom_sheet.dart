import 'package:asartha/common/style.dart';
import 'package:asartha/ui/user/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShowCustomBottomSheet {
  void logOutBottomSheet(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final width = MediaQuery.of(context).size.width;

    showMaterialModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Log Out',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8),
                Text(
                  'Apakah anda yakin ingin keluar?',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: width - 64,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _auth.signOut();

                      Navigator.pushReplacementNamed(
                          context, SignInPage.routeName);
                    },
                    child: const Text(
                      'Ya, Keluar',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: width - 64,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text(
                      'Batal',
                      style: TextStyle(fontSize: 18, color: secondary),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(
                        color: secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 200),
              ],
            ),
          ),
        );
      },
    );
  }
}
