import 'package:corona_cases_app/models/global_model.dart';
import 'package:corona_cases_app/services/model_service.dart';
import 'package:corona_cases_app/utils/globalstat.dart';
import 'package:corona_cases_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sizeConfigure.dart';

class GlobalDataScreen extends StatefulWidget {
  const GlobalDataScreen({Key key}) : super(key: key);

  @override
  _GlobalDataScreenState createState() => _GlobalDataScreenState();
}

class _GlobalDataScreenState extends State<GlobalDataScreen> {
  Future<Globaldata> globalData;
  @override
  void initState() {
    super.initState();
    globalData = CovidService.getGlobaldata();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Global Corona Virus Cases",
                style: GoogleFonts.lato(
                  fontSize: SizeConfig.safeBlockVertical * 2,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    globalData = CovidService.getGlobaldata();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 8,
          ),
          Expanded(
            child: FutureBuilder(
                future: globalData,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SpinKitWave(
                      color: Colors.cyan,
                    );
                  }
                  return Column(
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
                      buildData(snapshot.data.totalCase, snapshot.data.newCase,
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
                      buildData(snapshot.data.totalDeath,
                          snapshot.data.newDeath, kDeathColor),
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
                          snapshot.data.totalCase -
                              snapshot.data.totalDeath -
                              snapshot.data.totalRecovered,
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
                      buildData(snapshot.data.totalRecovered,
                          snapshot.data.recovered, kRecoveredColor),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
