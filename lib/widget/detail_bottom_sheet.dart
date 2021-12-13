import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/provider/address_provider.dart';
import 'package:asartha/provider/user_provider.dart';
import 'package:asartha/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailBottomSheet extends StatefulWidget {
  final Vacancy vacancy;
  const DetailBottomSheet({Key? key, required this.vacancy}) : super(key: key);

  @override
  State<DetailBottomSheet> createState() => _DetailBottomSheetState();
}

class _DetailBottomSheetState extends State<DetailBottomSheet> {
  bool partner = false;
  @override
  void initState() {
    super.initState();
    if (widget.vacancy.partner != null) {
      setState(() {
        partner = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2(
      builder: (
        context,
        AddressProvider address,
        UserProfileProvider profile,
        _,
      ) {
        if (address.state == ResultState.loading ||
            profile.state == ResultState.loading) {
          return const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else if (address.state == ResultState.error ||
            profile.state == ResultState.error) {
          return Center(
            child: Text(
              'Error',
              style: Theme.of(context).textTheme.headline4,
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 35),
            height: 562,
            width: MediaQuery.of(context).size.width,
            color: white,
            child: ListView(
              children: [
                Text(
                  'Detail',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 37,
                ),
                Text(
                  'Customer',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  profile.userProfile.name,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Alamat',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  address.address.addressOf,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Layanan',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  'Asisten Rumah Tangga',
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Tanggal Mulai',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  DateFormat.yMMMEd().format(widget.vacancy.startDate),
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Tanggal Selesai',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  DateFormat.yMMMEd().format(widget.vacancy.endDate),
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 10,
                ),
                partner
                    ? Text(
                        'Petugas',
                        style: Theme.of(context).textTheme.subtitle2,
                      )
                    : const SizedBox(),
                partner
                    ? Text(
                        '${widget.vacancy.partner}',
                        style: Theme.of(context).textTheme.headline3,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 21,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ElevatedButton(
                      child: Text(
                        'Close',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          );
        }
      },
    );
  }
}
