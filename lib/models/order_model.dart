// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  OrderModel({
    required this.id,
    required this.createdAt,
    required this.updateAt,
    required this.createdBy,
    required this.modifiedBy,
    required this.pickupDate,
    required this.estimatedDropoutDate,
    required this.recipientAddress,
    required this.recipientNumber,
    required this.type,
    required this.trackings,
    required this.created,
    required this.refused,
    required this.collect,
    required this.departure,
    required this.arrived,
    required this.handedOver,
    required this.complete,
    required this.failure,
  });

  String id;
  DateTime createdAt;
  DateTime updateAt;
  String createdBy;
  String modifiedBy;
  DateTime pickupDate;
  DateTime estimatedDropoutDate;
  String recipientAddress;
  String recipientNumber;
  String type;
  List<dynamic> trackings;
  bool created;
  bool refused;
  bool collect;
  bool departure;
  bool arrived;
  bool handedOver;
  bool complete;
  bool failure;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updateAt: DateTime.parse(json["updateAt"]),
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    pickupDate: DateTime.parse(json["pickupDate"]),
    estimatedDropoutDate: DateTime.parse(json["estimatedDropoutDate"]),
    recipientAddress: json["recipientAddress"],
    recipientNumber: json["recipientNumber"],
    type: json["type"],
    trackings: List<dynamic>.from(json["trackings"].map((x) => x)),
    created: json["created"],
    refused: json["refused"],
    collect: json["collect"],
    departure: json["departure"],
    arrived: json["arrived"],
    handedOver: json["handed_over"],
    complete: json["complete"],
    failure: json["failure"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updateAt": updateAt.toIso8601String(),
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "pickupDate": pickupDate.toIso8601String(),
    "estimatedDropoutDate": estimatedDropoutDate.toIso8601String(),
    "recipientAddress": recipientAddress,
    "recipientNumber": recipientNumber,
    "type": type,
    "trackings": List<dynamic>.from(trackings.map((x) => x)),
    "created": created,
    "refused": refused,
    "collect": collect,
    "departure": departure,
    "arrived": arrived,
    "handed_over": handedOver,
    "complete": complete,
    "failure": failure,
  };
}
