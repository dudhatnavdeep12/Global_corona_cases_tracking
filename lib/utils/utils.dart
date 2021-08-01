import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFFfee440);
Color kConfirmedColor = Color(0xFFfca311);
Color kActiveColor = Color(0xFFd88c9a);
Color kRecoveredColor = Color(0xFF29A746);
Color kDeathColor = Color(0xFF6D757D);

LinearGradient kGradientShimmer = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.blueGrey[300],
    Colors.grey[100],
  ],
);

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]}.';
