class WeatherDataModel {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;

  WeatherDataModel(
      {required this.date,
      required this.name,
      required this.temp,
      required this.main,
      required this.icon});

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "name": name,
      "temp": temp,
      "main": main,
      "icon": icon
    };
  }
}
