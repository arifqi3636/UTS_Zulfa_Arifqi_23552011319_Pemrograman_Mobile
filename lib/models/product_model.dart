// lib/models/product_model.dart
class ProductModel {
  final String id;
  final String name;
  final int price; // harga dalam rupiah, integer
  final String image; // url gambar

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'price': price, 'image': image};
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0) as int,
      image: map['image'] ?? '',
    );
  }
}
