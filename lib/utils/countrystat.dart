import 'package:corona_cases_app/sizeConfigure.dart';
import 'package:corona_cases_app/utils/globalstat.dart';
import 'package:corona_cases_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildDataCountry extends StatefulWidget {
  var country;
  BuildDataCountry({this.country});

  @override
  _BuildDataCountryState createState() => _BuildDataCountryState();
}

class _BuildDataCountryState extends State<BuildDataCountry> {
  bool initExpand = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
            margin: EdgeInsets.only(top: 2),
            alignment: Alignment.centerLeft,
            width: SizeConfig.blockSizeHorizontal * 93,
            child: ExpansionTile(
              collapsedBackgroundColor: Color(0xff4f772d),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              trailing: (initExpand)
                  ? Icon(
                      Icons.arrow_circle_up,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.arrow_circle_down,
                      color: Colors.white,
                    ),
              onExpansionChanged: (val) {
                setState(() {
                  initExpand = val;
                });
              },
              title: Text(
                widget.country.name,
                style: TextStyle(color: Colors.white),
              ),
              children: [
                Column(
                  children: [
                    Text(
                      "CONFIRMED",
                      style: GoogleFonts.lato(
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: kConfirmedColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1,
                    ),
                    buildData(widget.country.totalCase, widget.country.newCase,
                        kConfirmedColor),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 6,
                    ),
                    Text(
                      "DEATH",
                      style: GoogleFonts.lato(
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: kDeathColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1,
                    ),
                    buildData(widget.country.totalDeath,
                        widget.country.newDeath, kDeathColor),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 6,
                    ),
                    Text(
                      "ACTIVE",
                      style: GoogleFonts.lato(
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: kActiveColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1,
                    ),
                    buildDataActive(
                        widget.country.totalCase -
                            widget.country.totalDeath -
                            widget.country.totalRecovered,
                        kActiveColor),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 6,
                    ),
                    Text(
                      "RECOVERED",
                      style: GoogleFonts.lato(
                        fontSize: SizeConfig.safeBlockVertical * 2,
                        color: kRecoveredColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1,
                    ),
                    buildData(widget.country.totalRecovered,
                        widget.country.recovered, kRecoveredColor),
                  ],
                )
              ],
              initiallyExpanded: initExpand,
            ),
          ),
        ],
      ),
    );
  }
}
