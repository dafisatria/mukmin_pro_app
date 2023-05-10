import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/pray_times_month_model.dart';
import '../pray_times_month_view_model.dart';

class PrayTimesMonthScreen extends StatefulWidget {
  const PrayTimesMonthScreen({super.key});

  @override
  State<PrayTimesMonthScreen> createState() => _PrayTimesMonthScreenState();
}

class _PrayTimesMonthScreenState extends State<PrayTimesMonthScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final parameter =
        ModalRoute.of(context)!.settings.arguments as PrayTimesMonthModel;
    Provider.of<PrayTimesMonthProvider>(context, listen: false)
        .updatePrayTimesModel(parameter);
  }

  @override
  Widget build(BuildContext context) {
    final myProvider =
        Provider.of<PrayTimesMonthProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          myProvider.prayTimes.data!.lokasi!,
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/mosque_background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: const Color(0xffE5FDCE),
                    child: SizedBox(
                      height: 550,
                      width: 370,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tanggal',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff104A0D),
                                  ),
                                ),
                                SizedBox(
                                  width: 45,
                                ),
                                Text(
                                  'Subuh',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff104A0D),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Dzuhur',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff104A0D),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Ashar',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff104A0D),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Maghrib',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff104A0D),
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  'Isya',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff104A0D),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 0,
                            ),
                            Consumer<PrayTimesMonthProvider>(
                                builder: (context, myProvider, child) {
                              return Expanded(
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      myProvider.prayTimes.data!.jadwal!.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          myProvider.prayTimes.data!
                                              .jadwal![index].date!,
                                          style: GoogleFonts.notoSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff104A0D),
                                          ),
                                        ),
                                        Divider(),
                                        Text(
                                          myProvider.prayTimes.data!
                                              .jadwal![index].subuh!,
                                          style: GoogleFonts.notoSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff104A0D),
                                          ),
                                        ),
                                        Text(
                                          myProvider.prayTimes.data!
                                              .jadwal![index].dzuhur!,
                                          style: GoogleFonts.notoSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff104A0D),
                                          ),
                                        ),
                                        Text(
                                          myProvider.prayTimes.data!
                                              .jadwal![index].ashar!,
                                          style: GoogleFonts.notoSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff104A0D),
                                          ),
                                        ),
                                        Text(
                                          myProvider.prayTimes.data!
                                              .jadwal![index].maghrib!,
                                          style: GoogleFonts.notoSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff104A0D),
                                          ),
                                        ),
                                        Text(
                                          myProvider.prayTimes.data!
                                              .jadwal![index].isya!,
                                          style: GoogleFonts.notoSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff104A0D),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
