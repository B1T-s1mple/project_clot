class OrderModel {
  final int id;
  final double totalPrice;
  final String status;
  final String address;
  final String createdAt;
  final List<OrderItem> items; 

  OrderModel({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.address,
    required this.createdAt,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      totalPrice: (json['total_price'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      address: json['address'] ?? '',
      createdAt: json['created_at'] ?? '',
      
      items: json['items'] != null
          ? List<OrderItem>.from(json['items'].map((e) => OrderItem.fromJson(e)))
          : [],
    );
  }
}

class OrderItem {
  final int productId;
  final double priceAtPurchase;
  final String color;
  final String size;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.priceAtPurchase,
    required this.color,
    required this.size,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'] ?? 0,
      priceAtPurchase: (json['price_at_purchase'] ?? 0).toDouble(),
      color: json['color'] ?? '',
      size: json['size'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }
}