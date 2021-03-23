import 'dart:convert';

ArtikelModel artikelModelFromMap(String str) =>
    ArtikelModel.fromMap(json.decode(str));

String artikelModelToMap(ArtikelModel data) => json.encode(data.toMap());

class ArtikelModel {
  ArtikelModel({
    this.data,
  });

  final List<Datum> data;

  ArtikelModel copyWith({
    List<Datum> data,
  }) =>
      ArtikelModel(
        data: data ?? this.data,
      );

  factory ArtikelModel.fromMap(Map<String, dynamic> json) => ArtikelModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.channelId,
    this.title,
    this.thumbLarge,
    this.datePublish,
    this.description,
    this.tipe,
  });

  final int channelId;
  final String title;
  final String thumbLarge;
  final String datePublish;
  final String description;
  final String tipe;

  Datum copyWith({
    int channelId,
    String title,
    String thumbLarge,
    String datePublish,
    String description,
    String tipe,
  }) =>
      Datum(
        channelId: channelId ?? this.channelId,
        title: title ?? this.title,
        thumbLarge: thumbLarge ?? this.thumbLarge,
        datePublish: datePublish ?? this.datePublish,
        description: description ?? this.description,
        tipe: tipe ?? this.tipe,
      );

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        channelId: json["channel_id"],
        title: json["title"],
        thumbLarge: json["thumb_large"],
        datePublish: json["date_publish"],
        description: json["description"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toMap() => {
        "channel_id": channelId,
        "title": title,
        "thumb_large": thumbLarge,
        "date_publish": datePublish,
        "description": description,
        "tipe": tipe,
      };
}
