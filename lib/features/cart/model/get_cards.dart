class GetCards {
  final int id;
  final int productId;
  final String color;
  final String size;
  final int quantity;
  final ProductModel product; 

  GetCards({
    required this.id,
    required this.productId,
    required this.color,
    required this.size,
    required this.quantity,
    required this.product,
  });

  factory GetCards.fromJson(Map<String, dynamic> json) {
    return GetCards(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      color: json['color'] ?? '',
      size: json['size'] ?? '',
      quantity: json['quantity'] ?? 0,
      product: ProductModel.fromJson(json['product'] ?? {}),
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final double oldPrice;
  final bool isFreeShipping;
  final String gender;
  final List<String> images;
  final int categoryId;
  final bool isWishlisted;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.isFreeShipping,
    required this.gender,
    required this.images,
    required this.categoryId,
    required this.isWishlisted,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Rasmlarni oddiy List<String> ga xavfsiz o'tkazish
    List<String> imagesList = [];
    if (json['images'] != null) {
      for (var rasm in json['images']) {
        imagesList.add(rasm.toString());
      }
    }

    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      oldPrice: (json['old_price'] ?? 0).toDouble(),
      isFreeShipping: json['is_free_shipping'] ?? false,
      gender: json['gender'] ?? '',
      images: imagesList, // Tayyor oddiy ro'yxat
      categoryId: json['category_id'] ?? 0,
      isWishlisted: json['is_wishlisted'] ?? false,
    );
  }
}