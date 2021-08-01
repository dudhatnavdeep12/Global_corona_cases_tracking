class Globaldata {
  int newCase;
  int totalCase;
  int newDeath;
  int totalDeath;
  int recovered;
  int totalRecovered;
  DateTime date;

  Globaldata({
    this.date,
    this.newCase,
    this.newDeath,
    this.recovered,
    this.totalCase,
    this.totalDeath,
    this.totalRecovered,
  });

  factory Globaldata.fromJson(Map<String, dynamic> json) {
    return Globaldata(
      date: DateTime.parse(json['Date']),
      newCase: json['Global']['NewConfirmed'],
      newDeath: json['Global']['NewDeaths'],
      recovered: json['Global']['NewRecovered'],
      totalCase: json['Global']['TotalConfirmed'],
      totalDeath: json['Global']['TotalDeaths'],
      totalRecovered: json['Global']['TotalRecovered'],
    );
  }
}
