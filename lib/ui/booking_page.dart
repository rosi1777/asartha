import 'package:asartha/common/style.dart';
import 'package:asartha/widget/done_booking_page.dart';
import 'package:asartha/widget/process_boking_page.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      body: SafeArea(
          child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
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
                return const TabBarView(children: <Widget>[
                  ProcessBookingPage(),
                  DoneBookingPage(),
                ]);
              })),
        ),
      ),
    );
  }
}
