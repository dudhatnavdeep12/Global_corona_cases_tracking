import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sizeConfigure.dart';

Widget buildData(int totalCount, int todayCount, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Total",
            style: GoogleFonts.lato(
              fontSize: SizeConfig.safeBlockVertical * 2,
              color: color,
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 1,
          ),
          Text(
            totalCount.toString(),
            style: GoogleFonts.lato(
              fontSize: SizeConfig.safeBlockVertical * 3,
              color: color,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            "Today",
            style: GoogleFonts.lato(
              fontSize: SizeConfig.safeBlockVertical * 2,
              color: color,
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 1,
          ),
          Text(
            todayCount.toString(),
            style: GoogleFonts.lato(
              fontSize: SizeConfig.safeBlockVertical * 3,
              color: color,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildDataActive(int totalCount, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Total",
        style: GoogleFonts.lato(
          fontSize: SizeConfig.safeBlockVertical * 2,
          color: color,
        ),
      ),
      SizedBox(
        height: SizeConfig.safeBlockVertical * 1,
      ),
      Text(
        totalCount.toString(),
        style: GoogleFonts.lato(
          fontSize: SizeConfig.safeBlockVertical * 3,
          color: color,
        ),
      ),
    ],
  );
}
