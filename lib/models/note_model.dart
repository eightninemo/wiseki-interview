// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
  String title;
  String note;
  String type;
  DateTime createdAt;

  NoteModel({
    required this.title,
    required this.note,
    required this.type,
    required this.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        title: json["title"],
        note: json["note"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "note": note,
        "title": title,
        "type": type,
        "createdAt": createdAt.toIso8601String(),
      };
}
