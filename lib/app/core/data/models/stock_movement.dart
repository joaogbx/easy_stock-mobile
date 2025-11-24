import 'package:easy_stock/app/core/data/models/product_model.dart';

class StockMovement {
  final int id;
  final String type;
  final DateTime createdAt;
  final int quantity;
  final int companyId;
  final Product product;
  final int userId;

  StockMovement({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.quantity,
    required this.companyId,
    required this.product,
    required this.userId,
  });

  factory StockMovement.fromJson(Map<String, dynamic> json) {
    return StockMovement(
      id: json['id'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      quantity: json['quantity'],
      companyId: json['company_id'],
      product: Product.fromJson(
        json['product'],
      ),
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'created_at': createdAt.toIso8601String(),
      'quantity': quantity,
      'company_id': companyId,
      'product': product,
      'user_id': userId,
    };
  }

  StockMovement copyWith({
    int? id,
    String? type,
    DateTime? createdAt,
    int? quantity,
    int? companyId,
    Product? product,
    int? userId,
  }) {
    return StockMovement(
      id: id ?? this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
      companyId: companyId ?? this.companyId,
      product: product ?? this.product,
      userId: userId ?? this.userId,
    );
  }
}
