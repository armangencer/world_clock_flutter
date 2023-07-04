// To parse this JSON data, do
//
//     final ipTimeZone = ipTimeZoneFromJson(jsonString);

import 'dart:convert';

IpTimeZone ipTimeZoneFromJson(String str) =>
    IpTimeZone.fromJson(json.decode(str));

String ipTimeZoneToJson(IpTimeZone data) => json.encode(data.toJson());

class IpTimeZone {
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

  IpTimeZone({
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

  factory IpTimeZone.fromJson(Map<String, dynamic> json) => IpTimeZone(
        abbreviation: json["abbreviation"],
        clientIp: json["client_ip"],
        datetime: DateTime.parse(utcAdd(json["datetime"])),
        dayOfWeek: json["day_of_week"],
        dayOfYear: json["day_of_year"],
        dst: json["dst"],
        dstFrom: json["dst_from"],
        dstOffset: json["dst_offset"],
        dstUntil: json["dst_until"],
        rawOffset: json["raw_offset"],
        timezone: json["timezone"],
        unixtime: json["unixtime"],
        utcDatetime: DateTime.parse((json["utc_datetime"])),
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

String utcAdd(String abc) {
  if (abc.contains('+')) {
    return abc.split('+')[0];
  } else {
    int index = abc.lastIndexOf('-');
    return abc.substring(0, index);
  }
}
