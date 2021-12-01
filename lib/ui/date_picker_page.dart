import 'package:asartha/common/style.dart';
import 'package:flutter/material.dart';

class DatePickerPage extends StatelessWidget {
  static const routeName = '/date_picker_page';
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih Tanggal dan Waktu Memulai',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.date_range_outlined),
                  color: secondary,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih Tanggal dan Waktu Berakhir',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.date_range_outlined),
                  color: secondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
