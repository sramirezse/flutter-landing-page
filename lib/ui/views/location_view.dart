import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
          child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'LocationView',
          style:
              GoogleFonts.montserrat(fontSize: 80, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
