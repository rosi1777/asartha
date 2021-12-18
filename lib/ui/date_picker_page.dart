import 'package:asartha/common/style.dart';
import 'package:asartha/provider/add_vacancy_provider.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/date_picker_page';

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  var selectDateFirst = DateTime.now();
  DateTime selectDateSec = DateTime.now();
  final _auth = FirebaseAuth.instance;
  final _criteriaController = TextEditingController();
  int difference = 0;
  int price = 100000;
  int total = 0;

  void _datePickerFirst(DateTime time) {
    showDatePicker(
      context: context,
      initialDate: time,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(
          () {
            selectDateFirst = pickedDate;
          },
        );
      },
    );
  }

  void _datePickerSec(DateTime time) {
    showDatePicker(
      context: context,
      initialDate: selectDateFirst,
      firstDate: selectDateFirst,
      lastDate: DateTime(2025),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(
          () {
            selectDateSec = pickedDate;
            difference = daysBetween(selectDateFirst, selectDateSec);
            total = price * difference;
          },
        );
      },
    );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VacancyProvider(),
      child: Consumer<VacancyProvider>(
        builder: (context, provider, _) {
          if (provider.state == ResultState.loading) {
            return Scaffold(
              backgroundColor: snow,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (provider.state == ResultState.error) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return Scaffold(
              backgroundColor: snow,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: snow,
                iconTheme: IconThemeData(color: black),
                title: Text(
                  'Pilih Waktu',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pilih Tanggal dan Waktu Memulai',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            IconButton(
                              onPressed: () =>
                                  _datePickerFirst(selectDateFirst),
                              icon: const Icon(Icons.date_range_outlined),
                              color: secondary,
                            ),
                          ],
                        ),
                        Text(
                          "Tanggal : ${DateFormat.yMMMMEEEEd().format(selectDateFirst)}",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pilih Tanggal dan Waktu Berhenti',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            IconButton(
                              onPressed: () => _datePickerSec(selectDateSec),
                              icon: const Icon(Icons.date_range_outlined),
                              color: secondary,
                            ),
                          ],
                        ),
                        Text(
                          "Tanggal : ${DateFormat.yMMMMEEEEd().format(selectDateSec)}",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Tambahkan Kriteria',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _criteriaController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: hintText),
                              hintText: "Bersih-bersih, memasak, dll.",
                              fillColor: Colors.white70),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 157,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 34, right: 34, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Detail Pesanan',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: black)),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Layanan',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              'Asisten Rumah Tangga',
                              style: Theme.of(context).textTheme.headline2,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              'Rp. $total',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: black),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Builder(builder: (ctx) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: ElevatedButton(
                                child: Text(
                                  'Book',
                                  style: Theme.of(context).textTheme.button,
                                ),
                                onPressed: () async {
                                  bool babySitter = false;
                                  var userId = _auth.currentUser?.uid;
                                  var criteria = _criteriaController.text;
                                  await Provider.of<VacancyProvider>(ctx,
                                          listen: false)
                                      .addVacancy(
                                          userId!,
                                          selectDateFirst,
                                          selectDateSec,
                                          criteria,
                                          total,
                                          babySitter);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: secondary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
