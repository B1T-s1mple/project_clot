class AddToBagModel {
  final int productId;
  final String color;
  final String size;
  final int quantity;

  AddToBagModel({
    required this.productId,
    required this.color,
    required this.size,
    required this.quantity,
  });
  
  factory AddToBagModel.fromJson(Map<String, dynamic> json) {
    return AddToBagModel(
      productId: json['product_id '] ?? 0,
      size: json['size'] ?? '',
      color: json['color'] ?? '',
      quantity: (json['quantity'] ?? 0).toDouble(),
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "color": color,
      "size": size,
      "quantity": quantity,
    };
  }
}