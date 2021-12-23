import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/vacancy.dart';
import 'package:asartha/provider/address_provider.dart';
import 'package:asartha/provider/partner_provider.dart';
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
    if (widget.vacancy.partner != "") {
      setState(() {
        partner = true;
      });
    }
  }

  Widget _consumer2() {
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
                  'No Telepon',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  address.address.phone,
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
                  '${address.address.address}, ${address.address.city}',
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
                  widget.vacancy.role,
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
                Text(
                  'Biaya',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  '${widget.vacancy.price}',
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
                        widget.vacancy.partner,
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

  Widget _consumer3() {
    return Consumer3(
      builder: (
        context,
        AddressProvider address,
        UserProfileProvider profile,
        PartnerProfileProvider profileProvider,
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
          return _partnerDetailJobs(context, profile, '', '', profileProvider);
        } else {
          var userAddress = address.address;
          return _partnerDetailJobs(context, profile, userAddress.address,
              userAddress.city, profileProvider);
        }
      },
    );
  }

  Container _partnerDetailJobs(
      BuildContext context,
      UserProfileProvider profile,
      String address,
      String city,
      PartnerProfileProvider profileProvider) {
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
            'No Telepon',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            profile.userProfile.phoneNumber,
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
            '$address,$city',
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
            profileProvider.partnerProfile.role,
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
          Text(
            'Biaya',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Rp.${widget.vacancy.price}',
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
                  profileProvider.partnerProfile.name,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return partner ? _consumer3() : _consumer2();
  }
}
