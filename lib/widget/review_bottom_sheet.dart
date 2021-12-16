import 'package:asartha/common/style.dart';
import 'package:asartha/data/database/vacancy_firestore_helper.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:flutter/material.dart';

class ReviewBottomSheet extends StatefulWidget {
  final Vacancy vacancy;
  const ReviewBottomSheet({Key? key, required this.vacancy}) : super(key: key);

  @override
  _ReviewBottomSheetState createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  final _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 35),
      height: 562,
      width: MediaQuery.of(context).size.width,
      color: white,
      child: ListView(
        children: [
          Text(
            'review',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 21),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: secondary, width: 2),
            ),
            height: 177.0,
            child: TextField(
              keyboardType: TextInputType.name,
              style: input,
              maxLines: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'review',
                hintStyle: textHint,
              ),
              controller: _reviewController,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: ElevatedButton(
                child: Text(
                  'Kirim',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () async {
                  final fireStoreHelper = VacancyFirestoreHelper();
                  final review = _reviewController.text;
                  await fireStoreHelper.updateRevviewVacancy(
                      widget.vacancy.docId, review);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: secondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: ElevatedButton(
                child: Text(
                  'Tutup',
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
