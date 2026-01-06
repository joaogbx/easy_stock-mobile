import 'package:easy_stock/app/features/stock/data/model/stock_movement.dart';

class Product {
  final int id;
  final String name;
  final String measureUnit;
  final int quantity;
  final int companyId;
  final List<StockMovement> movements;

  Product({
    required this.id,
    required this.name,
    required this.measureUnit,
    required this.quantity,
    required this.companyId,
    List<StockMovement>? movements,
  }) : movements = movements ?? [];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      measureUnit: json['measure_unit'],
      quantity: json['quantity'],
      companyId: json['company_id'],
      movements: json['movements'] != null
          ? (json['movements'] as List)
                .map((e) => StockMovement.fromJson(e))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'measure_unit': measureUnit,
      'quantity': quantity,
      'company_id': companyId,
      'movements': movements.map((e) => e.toJson()).toList(),
    };
  }

  Product copyWith({
    int? id,
    String? name,
    String? measureUnit,
    int? quantity,
    int? companyId,
    List<StockMovement>? movements,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      measureUnit: measureUnit ?? this.measureUnit,
      quantity: quantity ?? this.quantity,
      companyId: companyId ?? this.companyId,
      movements: movements ?? this.movements,
    );
  }
}
