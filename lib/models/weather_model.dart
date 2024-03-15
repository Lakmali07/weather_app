// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
 final double currentTemp;
 final String currentSky;
 final double currentPressure;
 final double currentWindSpeed;
 final double currentHumidity;
 final String time;
 WeatherModel({
  required this.currentTemp,
  required this.currentSky,
  required this.currentPressure,
  required this.currentWindSpeed,
  required this.currentHumidity,
  required this.time,
 });

 WeatherModel copyWith({
  double? currentTemp,
  String? currentSky,
  double? currentPressure,
  double? currentWindSpeed,
  double? currentHumidity,
  String? time,
 }) {
  return WeatherModel(
   currentTemp: currentTemp ?? this.currentTemp,
   currentSky: currentSky ?? this.currentSky,
   currentPressure: currentPressure ?? this.currentPressure,
   currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
   currentHumidity: currentHumidity ?? this.currentHumidity,
   time :  time ?? this.time,
  );
 }

 Map<String, dynamic> toMap() {
  return <String, dynamic>{
   'currentTemp': currentTemp,
   'currentSky': currentSky,
   'currentPressure': currentPressure,
   'currentWindSpeed': currentWindSpeed,
   'currentHumidity': currentHumidity,
   'time' : time,
  };
 }

 factory WeatherModel.fromMap(Map<String, dynamic> currentWeatherData) {
  //final currentWeatherData = map['list'][0];

  return WeatherModel(
   currentTemp: currentWeatherData['main']['temp'],
   currentSky: currentWeatherData['weather'][0]['main'],
   currentPressure: currentWeatherData['main']['pressure'],
   currentWindSpeed: currentWeatherData['wind']['speed'],
   currentHumidity: currentWeatherData['main']['humidity'],
      time: currentWeatherData['dt_txt'],
  );
 }

 String toJson() => json.encode(toMap());

 factory WeatherModel.fromJson(Map<String, dynamic> source) {
    return WeatherModel.fromMap(source);
 }
// List<Area> areaList = list.map((obj) => Area.fromJson(obj)).toList();

 @override
 String toString() {
  return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
 }

 @override
 bool operator ==(covariant WeatherModel other) {
  if (identical(this, other)) return true;

  return other.currentTemp == currentTemp &&
      other.currentSky == currentSky &&
      other.currentPressure == currentPressure &&
      other.currentWindSpeed == currentWindSpeed &&
      other.currentHumidity == currentHumidity &&
  other.time == time;
 }

 @override
 int get hashCode {
  return currentTemp.hashCode ^
  currentSky.hashCode ^
  currentPressure.hashCode ^
  currentWindSpeed.hashCode ^
  currentHumidity.hashCode ^
  time.hashCode;
 }
}