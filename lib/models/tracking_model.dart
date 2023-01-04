// To parse this JSON data, do
//
//     final trackingModel = trackingModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TrackingModel> trackingModelFromJson(String str) => List<TrackingModel>.from(json.decode(str).map((x) => TrackingModel.fromJson(x)));

String trackingModelToJson(List<TrackingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrackingModel {
  TrackingModel({
    required this.id,
    required this.createdAt,
    required this.updateAt,
    required this.createdBy,
    required this.modifiedBy,
    required this.type,
  });

  int id;
  DateTime createdAt;
  DateTime updateAt;
  String createdBy;
  String modifiedBy;
  String type;

  factory TrackingModel.fromJson(Map<String, dynamic> json) => TrackingModel(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updateAt: DateTime.parse(json["updateAt"]),
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updateAt": updateAt.toIso8601String(),
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "type": type,
  };
}
