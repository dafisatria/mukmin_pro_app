import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mukmin_pro_app/model/city_model.dart';
import 'package:mukmin_pro_app/my_app.dart';
import 'package:mukmin_pro_app/view/screen/login_view_model.dart';
import 'package:mukmin_pro_app/view/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'prayer_times_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5FDCE),
      body: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<LoginProvider>(context, listen: false).getCity();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return body(provider);
  }

  Widget body(LoginProvider provider) {
    final isLoading = provider.state == LoginViewState.loading;
    final isError = provider.state == LoginViewState.error;

    if (isLoading) {
      // return const SplashScreen();
    }
    if (isError) {
      return const Center(
        child: Text('Gagal mengambil data'),
      );
    }
    return mainData(provider, context);
  }
}

Padding mainData(LoginProvider provider, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, Ikhwan/Akhwat!',
          style: GoogleFonts.notoSans(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 30,
              ),
              DropdownSearch<CityModel>(
                asyncItems: (_) async {
                  var response = await Dio().get(
                    "https://api.myquran.com/v1/sholat/kota/semua",
                  );
                  var models = (response.data as List)
                      .map((e) => CityModel.fromJson(e))
                      .toList();
                  return models;
                },
                popupProps: PopupProps.menu(
                  itemBuilder: (context, item, isSelected) {
                    return ListTile(
                      title: Text(
                        item.lokasi!,
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                  showSearchBox: true,
                ),
                dropdownBuilder: (context, selectedItem) => Text(
                  selectedItem?.lokasi ?? '',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "City",
                  ),
                ),
                onChanged: (value) {
                  provider.setValueCityId(value!.id!);
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.read<PrayerTimesProvider>().getPrayTimes(
                        provider.valueCity.id,
                        DateTime.now().year.toString(),
                        DateTime.now().month.toString(),
                        DateTime.now().day.toString(),
                      );
                  Navigator.of(context).pushReplacementNamed(
                    '/my-app',
                    arguments: context.read<PrayerTimesProvider>().prayTimes,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff104A0D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
