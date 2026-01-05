import 'package:easy_stock/app/core/models/product_model.dart';
import 'package:easy_stock/app/core/models/stock_movement.dart';
import 'package:easy_stock/app/core/models/user_model.dart';

class Company {
  final int id;
  final String name;
  final int? ownerId;
  final List<User> users;
  final List<Product> products;
  final List<StockMovement> movements;

  Company({
    required this.id,
    required this.name,
    this.ownerId,
    List<User>? users,
    List<Product>? products,
    List<StockMovement>? movements,
  }) : users = users ?? [],
       products = products ?? [],
       movements = movements ?? [];

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      ownerId: json['owner_id'],
      users: json['users'] != null
          ? (json['users'] as List).map((e) => User.fromJson(e)).toList()
          : [],
      products: json['products'] != null
          ? (json['products'] as List).map((e) => Product.fromJson(e)).toList()
          : [],
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
      'owner_id': ownerId,
      'users': users.map((e) => e.toJson()).toList(),
      'products': products.map((e) => e.toJson()).toList(),
      'movements': movements.map((e) => e.toJson()).toList(),
    };
  }

  Company copyWith({
    int? id,
    String? name,
    int? ownerId,
    List<User>? users,
    List<Product>? products,
    List<StockMovement>? movements,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      users: users ?? this.users,
      products: products ?? this.products,
      movements: movements ?? this.movements,
    );
  }
}
