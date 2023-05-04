import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffE5FDCE),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/the-prophets-mosque.png',
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Mukmin Pro',
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color(
                    0xff104A0D,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
