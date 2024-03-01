// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrdersModel {
  int order_id;
  int top_passenger_count;
  int current_passenger_count;
  int destination_vertices_id;
  int current_vertices_id;
  bool is_hurry;
  OrdersModel({
    required this.order_id,
    required this.top_passenger_count,
    required this.current_passenger_count,
    required this.destination_vertices_id,
    required this.current_vertices_id,
    required this.is_hurry,
  });

  OrdersModel copyWith({
    int? order_id,
    int? top_passenger_count,
    int? current_passenger_count,
    int? destination_vertices_id,
    int? current_vertices_id,
    bool? is_hurry,
  }) {
    return OrdersModel(
      order_id: order_id ?? this.order_id,
      top_passenger_count: top_passenger_count ?? this.top_passenger_count,
      current_passenger_count: current_passenger_count ?? this.current_passenger_count,
      destination_vertices_id: destination_vertices_id ?? this.destination_vertices_id,
      current_vertices_id: current_vertices_id ?? this.current_vertices_id,
      is_hurry: is_hurry ?? this.is_hurry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order_id': order_id,
      'top_passenger_count': top_passenger_count,
      'current_passenger_count': current_passenger_count,
      'destination_vertices_id': destination_vertices_id,
      'current_vertices_id': current_vertices_id,
      'is_hurry': is_hurry,
    };
  }

  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      order_id: map['order_id'] as int,
      top_passenger_count: map['top_passenger_count'] as int,
      current_passenger_count: map['current_passenger_count'] as int,
      destination_vertices_id: map['destination_vertices_id'] as int,
      current_vertices_id: map['current_vertices_id'] as int,
      is_hurry: map['is_hurry'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromJson(String source) => OrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdersModel(order_id: $order_id, top_passenger_count: $top_passenger_count, current_passenger_count: $current_passenger_count, destination_vertices_id: $destination_vertices_id, current_vertices_id: $current_vertices_id, is_hurry: $is_hurry)';
  }

  @override
  bool operator ==(covariant OrdersModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.order_id == order_id &&
      other.top_passenger_count == top_passenger_count &&
      other.current_passenger_count == current_passenger_count &&
      other.destination_vertices_id == destination_vertices_id &&
      other.current_vertices_id == current_vertices_id &&
      other.is_hurry == is_hurry;
  }

  @override
  int get hashCode {
    return order_id.hashCode ^
      top_passenger_count.hashCode ^
      current_passenger_count.hashCode ^
      destination_vertices_id.hashCode ^
      current_vertices_id.hashCode ^
      is_hurry.hashCode;
  }
}
