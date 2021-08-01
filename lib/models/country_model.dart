class ContryData {
  int newCase;
  int totalCase;
  int newDeath;
  int totalDeath;
  int recovered;
  int totalRecovered;
  String name;
  DateTime date;

  ContryData(
      {this.date,
      this.newCase,
      this.newDeath,
      this.recovered,
      this.totalCase,
      this.totalDeath,
      this.totalRecovered,
      this.name});

  factory ContryData.fromJson(Map<String, dynamic> json) {
    return ContryData(
      date: DateTime.parse(json['Date']),
      newCase: json['NewConfirmed'],
      newDeath: json['NewDeaths'],
      name: json['Country'],
      recovered: json['NewRecovered'],
      totalCase: json['TotalConfirmed'],
      totalDeath: json['TotalDeaths'],
      totalRecovered: json['TotalRecovered'],
    );
  }
}
