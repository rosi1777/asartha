import 'package:asartha/common/style.dart';
import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/provider/address_provider.dart';
import 'package:asartha/provider/get_all_vacancy_provider.dart';
import 'package:asartha/provider/user_provider.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:asartha/widget/detail_bottom_sheet.dart';
import 'package:asartha/widget/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Jobs extends StatelessWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllVacancyProvider>(
      builder: (context, provider, _) {
        if (provider.state == ResultState.loading) {
          return const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else if (provider.state == ResultState.noData) {
          return Center(
            child: Text(
              'Belum ada lowongan',
              style: Theme.of(context).textTheme.headline4,
            ),
          );
        } else if (provider.state == ResultState.error) {
          return Center(
            child: Text(
              'Error Terjadi Disini',
              style: Theme.of(context).textTheme.headline4,
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lowogan',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.vacancy.vacancy.length,
                  itemBuilder: (context, index) {
                    var vacancy = provider.vacancy.vacancy[index];
                    return _jobsCard(context, vacancy);
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }

  Widget _jobsCard(BuildContext context, Vacancy vacancy) {
    return Material(
      color: snow,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vacancy.role,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      'Mulai : ${DateFormat.yMMMEd().format(vacancy.startDate)}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'Selesai : ${DateFormat.yMMMEd().format(vacancy.endDate)}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                Text(
                  'Rp. 177.000',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: ElevatedButton(
                        child: Text(
                          'Detail',
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return MultiProvider(
                                child: DetailBottomSheet(vacancy: vacancy),
                                providers: [
                                  ChangeNotifierProvider(
                                    create: (_) =>
                                        UserProfileProvider(vacancy.user),
                                  ),
                                  ChangeNotifierProvider(
                                    create: (_) =>
                                        AddressProvider(vacancy.user, false),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: secondary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: ElevatedButton(
                        child: Text(
                          'Ambil',
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () async {
                          const title = "Ambil Lowongan";
                          const body =
                              "Apakah anda yakin ingin mengambil lowongan ini ?";
                          final action = await Dialogs.yesAbortDialog(
                              context, title, body);
                          if (action == DialogAction.yes) {
                            var uid = vacancy.user;
                            final FirebaseAuth _auth = FirebaseAuth.instance;
                            final partnerId = _auth.currentUser?.uid;
                            await Provider.of<GetAllVacancyProvider>(context,
                                    listen: false)
                                .updatePartnerApplication(
                                    partnerId!, uid, vacancy.docId);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: secondary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}
