import 'package:asartha/common/style.dart';
import 'package:asartha/provider/get_all_vacancy_provider.dart';
import 'package:asartha/utils/constant.dart';
import 'package:asartha/widget/job.dart';
import 'package:asartha/widget/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final bool partner;

  HomePage({Key? key, required this.partner}) : super(key: key);
  static const routeName = "/home_page";
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var uid = _auth.currentUser?.uid;
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
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
                    child: Image.network(
                        partner ? Constant.partnerImage : Constant.userImage,
                        width: 38,
                        height: 38,
                        fit: BoxFit.cover),
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
                height: 19,
              ),
              partner
                  ? Expanded(
                      child: ChangeNotifierProvider(
                        create: (_) => GetAllVacancyProvider(id: uid!),
                        child: const Jobs(),
                      ),
                    )
                  : const Services()
            ],
          ),
        ),
      ),
    );
  }
}
