import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/edit_profile_page';
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(21),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: secondary, width: 2),
                      ),
                    ),
                    height: 40.0,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nama Lengkap',
                        hintStyle: TextStyle(color: hintText),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: secondary, width: 2),
                      ),
                    ),
                    height: 40.0,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'contoh.email@gmail.com',
                        hintStyle: TextStyle(color: hintText),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nomor Telepon',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: secondary, width: 2),
                      ),
                    ),
                    height: 40.0,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: input,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '081999888777',
                        hintStyle: TextStyle(color: hintText),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                  child: Text(
                    'Simpan',
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
          ],
        ),
      ),
    );
  }
}
