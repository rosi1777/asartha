import 'package:asartha/common/style.dart';
import 'package:asartha/provider/get_partner_application_provider.dart';
import 'package:asartha/provider/get_user_vacancy_provider.dart';
import 'package:asartha/widget/done_booking_page.dart';
import 'package:asartha/widget/process_boking_page.dart';
import 'package:asartha/widget/process_job_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatelessWidget {
  final bool partner;
  BookingPage({Key? key, required this.partner}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print(partner);
    final id = _auth.currentUser?.uid;

    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: partner
                  ? Text(
                      "Pekerjaan",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  : Text(
                      "Pemesanan",
                      style: Theme.of(context).textTheme.headline6,
                    ),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: snow,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: TabBar(
                  indicatorColor: primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  labelColor: Colors.blue,
                  unselectedLabelColor: grey,
                  tabs: <Tab>[
                    Tab(
                      child: Text(
                        'Proses',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Selesai',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return TabBarView(
                  children: <Widget>[
                    partner
                        ? ChangeNotifierProvider(
                            create: (_) => GetPartnerVacancyProvider(id: id!),
                            child: const ProcessJobPage(),
                          )
                        : ChangeNotifierProvider(
                            create: (_) => GetVacancyProvider(id: id!),
                            child: const ProcessBookingPage(),
                          ),
                    partner
                        ? ChangeNotifierProvider(
                            create: (_) => GetPartnerVacancyProvider(id: id!),
                            child: DoneBookingPage(
                              partner: partner,
                            ),
                          )
                        : ChangeNotifierProvider(
                            create: (_) => GetVacancyProvider(id: id!),
                            child: DoneBookingPage(
                              partner: partner,
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
