import 'dart:convert';

import 'package:equatable/equatable.dart';

List<FormModel> logModelFromJson(String str) =>
    List<FormModel>.from(json.decode(str).map((x) => FormModel.fromJson(x)));

String logModelToJson(List<FormModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FormModel extends Equatable {
  final String? title;
  final String? description;
  final String? id;
  final DateTime? date;

  const FormModel({
    this.title,
    this.description,
    this.id,
    this.date,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, description, date];

  FormModel copyWith({
    String? title,
    String? description,
    String? id,
    DateTime? date,
    required DateTime dateTime,
  }) =>
      FormModel(
        title: title ?? this.title,
        description: description ?? this.description,
        id: id ?? this.id,
        date: date ?? this.date,
      );

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        title: json["title"],
        description: json["description"],
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  get dateTime => null;

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "id": id,
        "date": date?.toIso8601String(),
      };
}
