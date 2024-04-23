import 'package:flutter_nasa_app/domain/entities/apod.dart';

class ApodModel extends Apod{
  const ApodModel({
    super.copyright,
    super.date,
    super.explanation,
    super.hdurl,
    super.mediaType,
    super.serviceVersion,
    super.thumbnailUrl,
    super.title,
    super.url,
  });

  // Cria ApodModel baseado em json
  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
    copyright: json["copyright"] ?? "Nasa Apod",
    date: DateTime.parse(json["date"]),
    explanation: json["explanation"],
    hdurl: json["hdurl"],
    mediaType: json["media_type"],
    serviceVersion: json["service_version"],
    thumbnailUrl: json["thumbnail_url"],
    title: json["title"],
    url: json["url"],
  );

  // Cria Json Baseado em ApodModel
  Map<String, dynamic> toJson() => {
    "copyright": copyright,
    "date": date.toString(),
    "explanation": explanation,
    "hdurl": hdurl,
    "media_type": mediaType,
    "service_version": serviceVersion,
    "thumbnail_url": thumbnailUrl,
    "title": title,
    "url": url,
  };
}