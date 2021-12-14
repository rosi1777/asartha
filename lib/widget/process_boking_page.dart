import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/provider/get_user_vacancy_provider.dart';
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
                return _buildBookingCard(context, vacancy);
              },
            );
          }
        },
      ),
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
                DateFormat.yMMMEd().format(vacancy.startDate),
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

// Container(
//         margin: const EdgeInsets.only(top: 25, left: 26, right: 26),
//         padding: const EdgeInsets.only(left: 18, right: 18, top: 14),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: white,
//         ),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(7),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.blue[100],
//               ),
//               child: Center(
//                 child: Text(
//                   vacancy.status,
//                   style: Theme.of(context).textTheme.headline5,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 3,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Asisten Rumah Tangga',
//                       style: Theme.of(context).textTheme.headline3,
//                     ),
//                     Text(
//                       '${vacancy.startDate}',
//                       style: Theme.of(context).textTheme.subtitle2,
//                     ),
//                   ],
//                 ),
//                 Text(
//                   'Rp. 177.000',
//                   style: Theme.of(context).textTheme.headline3,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 9,
//             ),
//             Divider(
//               color: grey,
//             ),
//             const SizedBox(
//               height: 9,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Fathorrosi',
//                       style: Theme.of(context).textTheme.headline3,
//                     ),
//                     Text(
//                       'Asisten Rumah Tangga',
//                       style: Theme.of(context).textTheme.subtitle2,
//                     ),
//                   ],
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Image.asset('assets/images/user.jpg',
//                       width: 35, height: 35, fit: BoxFit.cover),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 13,
//             ),
//           ],
//         ),
//       ),
