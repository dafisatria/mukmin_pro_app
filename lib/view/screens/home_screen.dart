import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/pray_times_model.dart';
import '../home_view_model.dart';
import '../pray_times_month_view_model.dart';
import '../widget/card_home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final parameter =
        ModalRoute.of(context)!.settings.arguments as PrayTimesModel;
    Provider.of<HomeProvider>(context, listen: false)
        .updatePrayTimesModel(parameter);

    Provider.of<HomeProvider>(context, listen: false).setDateTimes(parameter);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xffE5FDCE),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assalamualaikum',
              style: GoogleFonts.notoSans(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: const Color(0xff104A0D),
              ),
            ),
            Text(
              provider.prayTimes.data!.jadwal!.tanggal!,
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xff104A0D),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                '/login',
              );
            },
            icon: const Icon(
              Icons.login_outlined,
              color: Color(0xff104A0D),
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<HomeProvider>(builder: (context, myProvider, child) {
                  return CardHome(
                    parameter: myProvider.prayTimes,
                    image: 'assets/mosque_background.jpg',
                    prayTimes: DateFormat.Hm().format(myProvider.subuh!),
                    times: 'Subuh',
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(builder: (context, myProvider, child) {
                  return CardHome(
                    parameter: myProvider.prayTimes,
                    image: 'assets/dzuhur.jpg',
                    prayTimes: DateFormat.Hm().format(myProvider.dzuhur!),
                    times: 'Dzuhur',
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(builder: (context, myProvider, child) {
                  return CardHome(
                    parameter: myProvider.prayTimes,
                    image: 'assets/ashar.jpg',
                    prayTimes: DateFormat.Hm().format(myProvider.ashar!),
                    times: 'Ashar',
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(builder: (context, myProvider, child) {
                  return CardHome(
                    parameter: myProvider.prayTimes,
                    image: 'assets/maghrib.jpg',
                    prayTimes: DateFormat.Hm().format(myProvider.maghrib!),
                    times: 'Maghrib',
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(builder: (context, myProvider, child) {
                  return CardHome(
                    parameter: myProvider.prayTimes,
                    image: 'assets/isya.jpg',
                    prayTimes: DateFormat.Hm().format(myProvider.isya!),
                    times: 'Isya',
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<PrayTimesMonthProvider>().getPrayTimesMonth(
                id: provider.prayTimes.data!.id!,
                year:
                    context.read<PrayTimesMonthProvider>().now.year.toString(),
                month:
                    context.read<PrayTimesMonthProvider>().now.month.toString(),
              );
          Navigator.of(context).pushNamed(
            '/pray-times',
            arguments: context.read<PrayTimesMonthProvider>().prayTimes,
          );
        },
        backgroundColor: const Color(0xff45871B),
        elevation: 20.0,
        child: const Icon(
          Icons.calendar_month_outlined,
          color: Color(0xffE5FDCE),
        ),
      ),
    );
  }
}
