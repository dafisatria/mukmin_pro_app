import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/city_model.dart';
import '../home_view_model.dart';
import '../login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(
              "assets/mosque_background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 230,
                      width: 320,
                      child: Card(
                        color: const Color(0xffE5FDCE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, Akhi/Ukhti!',
                                style: GoogleFonts.notoSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff104A0D),
                                ),
                              ),
                              Text(
                                'Please choose your current location',
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff104A0D),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DropdownSearch<CityModel>(
                                asyncItems: (_) async {
                                  await provider.getCity();
                                  return provider.cities;
                                },
                                popupProps: PopupProps.dialog(
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
                                  loadingBuilder: (context, searchEntry) {
                                    return const SpinKitFoldingCube(
                                      color: Color(0xff45871B),
                                      size: 30.0,
                                    );
                                  },
                                ),
                                dropdownBuilder: (context, selectedItem) =>
                                    Text(
                                  selectedItem?.lokasi ??
                                      'Belum Memilih Lokasi',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    labelText: "City",
                                  ),
                                ),
                                onChanged: (value) {
                                  provider.setValueCityId(value!.id!);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (provider.valueCity.id == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(provider.snackBar);
                                      } else {
                                        await context
                                            .read<HomeProvider>()
                                            .getPrayTimes(
                                              id: provider.valueCity.id!,
                                              year: context
                                                  .read<HomeProvider>()
                                                  .now
                                                  .year
                                                  .toString(),
                                              month: context
                                                  .read<HomeProvider>()
                                                  .now
                                                  .month
                                                  .toString(),
                                              day: context
                                                  .read<HomeProvider>()
                                                  .now
                                                  .day
                                                  .toString(),
                                            );
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                          '/home',
                                          arguments: context
                                              .read<HomeProvider>()
                                              .prayTimes,
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff104A0D),
                                      elevation: 7,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: const Text('Get Started'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
