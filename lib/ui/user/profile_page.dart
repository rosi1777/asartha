import 'dart:io';

import 'package:asartha/common/style.dart';
import 'package:asartha/provider/user_provider.dart';
import 'package:asartha/ui/address_page.dart';
import 'package:asartha/ui/user//edit_profile_page.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:asartha/widget/logout_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        uploadImage(_image!);
      } else {
        showSnackBar("No File selected", const Duration(milliseconds: 400));
      }
    });
  }

  Future uploadImage(File _image) async {
    final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final id = _auth.currentUser?.uid;
    Reference reference =
        FirebaseStorage.instance.ref().child('$id/images').child("post_$imgId");

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();

    await firestore
        .collection('users')
        .doc(id)
        .collection('profile')
        .where('id', isEqualTo: id)
        .get()
        .then((value) async {
      var docs = value.docs[0].id;
      print(docs);
      try {
        await firestore
            .collection('users')
            .doc(id)
            .collection('profile')
            .doc(docs)
            .update({'imageUrl': downloadURL}).then((value) =>
                Provider.of<UserProfileProvider>(context, listen: false)
                    .getUserProfile(id!));
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const bool partner = false;
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Center(
              child: Consumer<UserProfileProvider>(
                builder: (context, provider, _) {
                  if (provider.state == ResultState.loading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 25),
                        Text(
                          'Memuat Profile...',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    );
                  } else if (provider.state == ResultState.error) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 25),
                        Text(
                          'Something Wrong ....',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                provider.userProfile.imageUrl,
                                width: 177,
                                height: 177,
                              ),
                            ),
                            Container(
                              transform:
                                  Matrix4.translationValues(100.0, 135.0, 0.0),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: black,
                                ),
                                onPressed: () {
                                  imagePickerMethod();
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: secondary, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                    context, EditProfilePage.routeName,
                                    arguments: provider.userProfile)
                                .then(
                              (value) => Provider.of<UserProfileProvider>(
                                      context,
                                      listen: false)
                                  .getUserProfile(provider.userProfile.id),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: secondary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Profile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 16),
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
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    style: input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: provider.userProfile.name,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline2),
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
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    style: input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: provider.userProfile.email,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline2),
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
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    style: input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            ('0${provider.userProfile.phoneNumber}'),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline2),
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
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    style: input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '******',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: width,
                            height: 132,
                            color: white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: white,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AddressPage.routeName,
                                          arguments: partner);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: secondary,
                                              ),
                                              const SizedBox(width: 16),
                                              const Text(
                                                'Alamat',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.navigate_next),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: grey,
                                  height: 10,
                                ),
                                Material(
                                  color: white,
                                  child: InkWell(
                                    onTap: () {
                                      ShowCustomBottomSheet()
                                          .logOutBottomSheet(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.logout,
                                                color: secondary,
                                              ),
                                              const SizedBox(width: 16),
                                              const Text(
                                                'Logout',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(Icons.navigate_next),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 100)
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
