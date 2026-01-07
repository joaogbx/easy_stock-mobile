class DashboardModel {
  final int stockOutCount;
  final int stockInCount;
  final int totalProducts;
  final int totalStockQuantity;

  DashboardModel({
    required this.stockOutCount,
    required this.stockInCount,
    required this.totalProducts,
    required this.totalStockQuantity,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    stockOutCount: json['stockOutCount'] ?? 0,
    stockInCount: json['stockInCount'] ?? 0,
    totalProducts: json['totalProducts'] ?? 0,
    totalStockQuantity: json['totalStockQuantity'] ?? 0,
  );
}
