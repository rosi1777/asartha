import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/edit_profile_page';
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: snow,
      appBar: AppBar(
        backgroundColor: snow,
        iconTheme: IconThemeData(color: black),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: black),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: TextButton(
                child: const Text(
                  'Edit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {}),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/images/user.jpg'),
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 309,
                  width: width - 32,
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama',
                              style: TextStyle(color: grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Someone Here',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alamat Email',
                              style: TextStyle(color: grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'SomeoneHere@gmail.com',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nomor Telepon',
                              style: TextStyle(color: grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '081909090909',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(color: grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'SomeoneHere123',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
