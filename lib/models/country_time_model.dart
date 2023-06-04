// To parse this JSON data, do
//
//     final countryTimeModel = countryTimeModelFromJson(jsonString);

import 'dart:convert';

CountryTimeModel countryTimeModelFromJson(String str) =>
    CountryTimeModel.fromJson(json.decode(str));

String countryTimeModelToJson(CountryTimeModel data) =>
    json.encode(data.toJson());

class CountryTimeModel {
  String abbreviation;
  String clientIp;
  DateTime datetime;
  int dayOfWeek;
  int dayOfYear;
  bool dst;
  dynamic dstFrom;
  int dstOffset;
  dynamic dstUntil;
  int rawOffset;
  String timezone;
  int unixtime;
  DateTime utcDatetime;
  String utcOffset;
  int weekNumber;

  CountryTimeModel({
    required this.abbreviation,
    required this.clientIp,
    required this.datetime,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dst,
    this.dstFrom,
    required this.dstOffset,
    this.dstUntil,
    required this.rawOffset,
    required this.timezone,
    required this.unixtime,
    required this.utcDatetime,
    required this.utcOffset,
    required this.weekNumber,
  });

  factory CountryTimeModel.fromJson(Map<String, dynamic> json) =>
      CountryTimeModel(
        abbreviation: json["abbreviation"],
        clientIp: json["client_ip"],
        datetime: DateTime.parse(json["datetime"]),
        dayOfWeek: json["day_of_week"],
        dayOfYear: json["day_of_year"],
        dst: json["dst"],
        dstFrom: json["dst_from"],
        dstOffset: json["dst_offset"],
        dstUntil: json["dst_until"],
        rawOffset: json["raw_offset"],
        timezone: json["timezone"],
        unixtime: json["unixtime"],
        utcDatetime: DateTime.parse(json["utc_datetime"]),
        utcOffset: json["utc_offset"],
        weekNumber: json["week_number"],
      );

  Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation,
        "client_ip": clientIp,
        "datetime": datetime.toIso8601String(),
        "day_of_week": dayOfWeek,
        "day_of_year": dayOfYear,
        "dst": dst,
        "dst_from": dstFrom,
        "dst_offset": dstOffset,
        "dst_until": dstUntil,
        "raw_offset": rawOffset,
        "timezone": timezone,
        "unixtime": unixtime,
        "utc_datetime": utcDatetime.toIso8601String(),
        "utc_offset": utcOffset,
        "week_number": weekNumber,
      };
}
