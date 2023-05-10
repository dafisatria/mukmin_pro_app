import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mukmin_pro_app/view/screen/prayer_times_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/pray_times_model.dart';

class PrayTimesScreen extends StatelessWidget {
  const PrayTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parameter =
        ModalRoute.of(context)!.settings.arguments as PrayTimesModel;
    final provider = Provider.of<PrayerTimesProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Color(0xffE5FDCE),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jadwal Sholat Hari Ini',
              style: GoogleFonts.notoSans(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(
            //   'Wilayah ${context.read<PrayerTimesProvider>().prayTimes.data!.lokasi.toString()}, Indonesia',
            //   style: GoogleFonts.notoSans(
            //     fontSize: 14,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 300,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff1BBD32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  '${DateFormat('MMMMEEEEd').format(DateTime.now())}',
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Card(
                color: Color(0xffE5FDCE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: Color(0xff45871B),
                  ),
                ),
                elevation: 7,
                child: SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subuh',
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              parameter.data!.jadwal!.subuh.toString(),
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xff45871B),
                          thickness: 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dzuhur',
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              parameter.data!.jadwal!.dzuhur.toString(),
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xff45871B),
                          thickness: 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ashar',
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              parameter.data!.jadwal!.ashar.toString(),
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xff45871B),
                          thickness: 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Maghrib',
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              parameter.data!.jadwal!.maghrib.toString(),
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Color(0xff45871B),
                          thickness: 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Isya',
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              parameter.data!.jadwal!.isya.toString(),
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
