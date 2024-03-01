import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class BusLine {
  String name;
  int price;
  String city_name;
  List<dynamic> bus_line;
  BusLine({
    required this.name,
    required this.price,
    required this.city_name,
    required this.bus_line,
  });

  BusLine copyWith({
    String? name,
    int? price,
    String? city_name,
    List<dynamic>? bus_line,
  }) {
    return BusLine(
      name: name ?? this.name,
      price: price ?? this.price,
      city_name: city_name ?? this.city_name,
      bus_line: bus_line ?? this.bus_line,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'city_name': city_name,
      'bus_line': bus_line,
    };
  }

  factory BusLine.fromMap(Map<String, dynamic> map) {
    return BusLine(
      name: map['name'] as String,
      price: map['price'] as int,
      city_name: map['city_name'] as String,
      bus_line: List<dynamic>.from((map['bus_line'] as List<dynamic>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory BusLine.fromJson(String source) => BusLine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BusLine(name: $name, price: $price, city_name: $city_name, bus_line: $bus_line)';
  }

  @override
  bool operator ==(covariant BusLine other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.price == price &&
      other.city_name == city_name &&
      listEquals(other.bus_line, bus_line);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      city_name.hashCode ^
      bus_line.hashCode;
  }
}
