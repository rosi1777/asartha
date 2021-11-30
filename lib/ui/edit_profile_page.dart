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
        actions: [
          Align(
            alignment: Alignment.topCenter,
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
        padding: const EdgeInsets.all(26),
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
                  padding: const EdgeInsets.all(26),
                  color: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40.0,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Fathorrosi',
                              hintStyle: Theme.of(context).textTheme.headline2),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Alamat Email',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40.0,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'fathorrosi1777@gmail.com',
                              hintStyle: Theme.of(context).textTheme.headline2),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No Telepon',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40.0,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '081238657974',
                              hintStyle: Theme.of(context).textTheme.headline2),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40.0,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: input,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '******',
                              hintStyle: Theme.of(context).textTheme.headline2),
                        ),
                      ),
                    ],
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
