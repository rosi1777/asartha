import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/partner_profile.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/provider/get_user_vacancy_provider.dart';
import 'package:asartha/provider/partner_provider.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProcessBookingPage extends StatelessWidget {
  const ProcessBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: Consumer<GetVacancyProvider>(
        builder: (context, vacancyProvider, _) {
          if (vacancyProvider.state == ResultState.loading) {
            return const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (vacancyProvider.state == ResultState.noData) {
            return Center(
              child: Text(
                'Belum ada data',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else if (vacancyProvider.state == ResultState.error) {
            return Center(
              child: Text(
                'Error Terjadi',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: vacancyProvider.vacancy.vacancy.length,
              itemBuilder: (context, index) {
                var vacancy = vacancyProvider.vacancy.vacancy[index];
                if (vacancy.status == 'Dikirim') {
                  return _buildBookingCard(context, vacancy);
                } else if (vacancy.status == 'Diterima') {
                  return _buildAcceptedBookingCard(context, vacancy);
                } else {
                  return const SizedBox();
                }
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildAcceptedBookingCard(BuildContext context, Vacancy vacancy) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 26, right: 26),
      padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: Center(
              child: Text(
                vacancy.status,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
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
          Divider(
            color: grey,
          ),
          const SizedBox(
            height: 9,
          ),
          ChangeNotifierProvider(
              create: (_) => PartnerProfileProvider(vacancy.partner),
              child: _buildPartner()),
          const SizedBox(
            height: 13,
          ),
        ],
      ),
    );
  }

  Widget _buildPartner() {
    return Consumer<PartnerProfileProvider>(
      builder: (context, provider, _) {
        if (provider.state == ResultState.loading) {
          return const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else if (provider.state == ResultState.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.partnerProfile.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    provider.partnerProfile.role,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/user.jpg',
                    width: 35, height: 35, fit: BoxFit.cover),
              ),
            ],
          );
        } else {
          return Text(
            'Something Wrong ....',
            style: Theme.of(context).textTheme.subtitle1,
          );
        }
      },
    );
  }

  Widget _buildBookingCard(BuildContext context, Vacancy vacancy) {
    return Material(
      color: snow,
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 26, right: 26),
        padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
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
                    color: Colors.green[100],
                  ),
                  child: Center(
                    child: Text(
                      vacancy.status,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                vacancy.role,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mulai : ${DateFormat.yMMMEd().format(vacancy.startDate)}',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selesai : ${DateFormat.yMMMEd().format(vacancy.endDate)}',
                style: Theme.of(context).textTheme.subtitle2,
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
    );
  }
}
