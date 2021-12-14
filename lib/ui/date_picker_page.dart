import 'package:asartha/common/style.dart';
import 'package:asartha/provider/add_vacancy_provider.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePickerPage extends StatefulWidget {
  static const routeName = '/date_picker_page';
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  var selectDateFirst = DateTime.now();
  DateTime selectDateSec = DateTime.now();
  final _auth = FirebaseAuth.instance;
  final _criteriaController = TextEditingController();

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
          },
        );
      },
    );
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
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                          onPressed: () => _datePickerFirst(selectDateFirst),
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
                              var userId = _auth.currentUser?.uid;
                              var criteria = _criteriaController.text;
                              await Provider.of<VacancyProvider>(ctx,
                                      listen: false)
                                  .addVacancy(
                                userId!,
                                selectDateFirst,
                                selectDateSec,
                                criteria,
                              );
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
              ),
            );
          }
        },
      ),
    );
  }
}
