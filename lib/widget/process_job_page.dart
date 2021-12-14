import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/provider/address_provider.dart';
import 'package:asartha/provider/get_partner_application_provider.dart';
import 'package:asartha/provider/partner_provider.dart';
import 'package:asartha/provider/user_provider.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:asartha/widget/detail_bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProcessJobPage extends StatelessWidget {
  const ProcessJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: Consumer<GetPartnerVacancyProvider>(
        builder: (context, provider, _) {
          if (provider.state == ResultState.loading) {
            return const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == ResultState.noData) {
            return Center(
              child: Text(
                'Belum ada data',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else if (provider.state == ResultState.error) {
            return Center(
              child: Text(
                'Error Terjadi',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.vacancy.vacancy.length,
              itemBuilder: (context, index) {
                var vacancy = provider.vacancy.vacancy[index];
                return _buildPartnerJobsPage(context, vacancy);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildPartnerJobsPage(BuildContext context, Vacancy vacancy) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25, left: 26, right: 26),
          padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#21177',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[100]),
                    child: Center(
                      child: Text(
                        'Diterima',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  )
                ],
              ),
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
                              ),
                              ChangeNotifierProvider(
                                create: (_) =>
                                    PartnerProfileProvider(vacancy.partner),
                              ),
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
              const SizedBox(
                height: 9,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    child: Text(
                      'Batalkan',
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
