import 'package:corona_cases_app/services/model_service.dart';
import 'package:corona_cases_app/utils/countrystat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sizeConfigure.dart';

class ContryDataScreen extends StatefulWidget {
  const ContryDataScreen({Key key}) : super(key: key);

  @override
  _ContryDataScreenState createState() => _ContryDataScreenState();
}

class _ContryDataScreenState extends State<ContryDataScreen> {
  Future contrydata;
  @override
  void initState() {
    super.initState();
    contrydata = CovidService.getContrydata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
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
                    contrydata = CovidService.getContrydata();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: contrydata,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitWave(
                      color: Colors.cyan,
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return BuildDataCountry(
                      country: snapshot.data[i],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
