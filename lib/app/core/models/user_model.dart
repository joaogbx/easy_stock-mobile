import 'package:easy_stock/app/core/models/company_model.dart';
import 'package:easy_stock/app/core/models/stock_movement.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  final int? companyId;
  final Company? company;
  final Company? companyOwned;
  final List<StockMovement> movements;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    this.companyId,
    this.company,
    this.companyOwned,
    List<StockMovement>? movements,
  }) : movements = movements ?? [];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      companyId: json['company_id'],
      company: json['company'] != null
          ? Company.fromJson(json['company'])
          : null,
      companyOwned: json['companyOwned'] != null
          ? Company.fromJson(json['companyOwned'])
          : null,
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
      'email': email,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'company_id': companyId,
      'company': company?.toJson(),
      'companyOwned': companyOwned?.toJson(),
      'movements': movements.map((e) => e.toJson()).toList(),
    };
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? role,
    DateTime? createdAt,
    int? companyId,
    Company? company,
    Company? companyOwned,
    List<StockMovement>? movements,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      companyId: companyId ?? this.companyId,
      company: company ?? this.company,
      companyOwned: companyOwned ?? this.companyOwned,
      movements: movements ?? this.movements,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      companyId: map['company_id'] != null ? map['company_id'] as int : null,
      company: map['company'] != null
          ? Company.fromJson(map['company'] as Map<String, dynamic>)
          : null,
      companyOwned: map['companyOwned'] != null
          ? Company.fromJson(map['companyOwned'] as Map<String, dynamic>)
          : null,
      movements: map['movements'] != null
          ? (map['movements'] as List)
                .map((e) => StockMovement.fromJson(e as Map<String, dynamic>))
                .toList()
          : [],
    );
  }
}
