import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacementNamed('/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5FDCE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/the-prophets-mosque.png',
              height: 150,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Mukmin Pro',
              style: GoogleFonts.notoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff104A0D)),
            ),
            const SizedBox(
              height: 50,
            ),
            const SpinKitFoldingCube(
              color: Color(0xff45871B),
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
