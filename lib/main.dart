import 'package:corona_cases_app/screens/countrydatascreen.dart';
import 'package:corona_cases_app/screens/globalscreen.dart';
import 'package:corona_cases_app/sizeConfigure.dart';
import 'package:corona_cases_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String state = "Global";
  @override
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Color(0xff132a13),
          child: Column(
            children: [
              Container(
                height: SizeConfig.safeBlockVertical * 7,
                width: SizeConfig.screenWidth,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Covid19",
                      style: GoogleFonts.lato(
                          fontSize: SizeConfig.safeBlockVertical * 3,
                          letterSpacing: 2,
                          color: Color(0xffff5d8f)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    (state == "Global")
                        ? Text(
                            "Global",
                            style: GoogleFonts.lato(
                                fontSize: SizeConfig.safeBlockVertical * 3,
                                letterSpacing: 2,
                                color: Color(0xfffadde1)),
                          )
                        : Text(
                            "Country",
                            style: GoogleFonts.lato(
                                fontSize: SizeConfig.safeBlockVertical * 3,
                                letterSpacing: 2,
                                color: Color(0xffd8e2dc)),
                          ),
                  ],
                ),
              ),
              Expanded(
                child: (state == "Global")
                    ? GlobalDataScreen()
                    : ContryDataScreen(),
              ),
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.safeBlockVertical * 8,
                color: Color(0xff8e7dbe),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          state = "Global";
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Global",
                            style: GoogleFonts.lato(
                              color: kPrimaryColor,
                              letterSpacing: 1,
                              fontSize: SizeConfig.safeBlockVertical * 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          state == "Global"
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          state = "Country";
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Country",
                            style: GoogleFonts.lato(
                              color: kPrimaryColor,
                              letterSpacing: 1,
                              fontSize: SizeConfig.safeBlockVertical * 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          state == "Country"
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
