// lib/pages/cart_grid_page.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartGridPage extends StatelessWidget {
  const CartGridPage({super.key});

  // Contoh data produk ikan hias
  List<ProductModel> get sampleProducts => [
    ProductModel(
      id: 'cupang-red',
      name: 'Cupang Halfmoon Merah',
      price: 25000,
      image:
          'https://images.unsplash.com/photo-1590706483728-9b5e917edcc1?auto=format&fit=crop&w=800&q=60',
    ),
    ProductModel(
      id: 'guppy-blue',
      name: 'Guppy Blue Fancy',
      price: 18000,
      image:
          'https://images.unsplash.com/photo-1557050543-4d5f42d0a6a3?auto=format&fit=crop&w=800&q=60',
    ),
    ProductModel(
      id: 'koi-1',
      name: 'Koi Sanke',
      price: 150000,
      image:
          'https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=800&q=60',
    ),
    ProductModel(
      id: 'neon-tetra',
      name: 'Neon Tetra (Pack 5)',
      price: 40000,
      image:
          'https://images.unsplash.com/photo-1574755393849-623942616676?auto=format&fit=crop&w=800&q=60',
    ),
    ProductModel(
      id: 'angelfish',
      name: 'Angelfish (Medium)',
      price: 60000,
      image:
          'https://images.unsplash.com/photo-1522184216315-dfa0b6f99c84?auto=format&fit=crop&w=800&q=60',
    ),
    ProductModel(
      id: 'betta-crowntail',
      name: 'Cupang Crowntail',
      price: 30000,
      image:
          'https://images.unsplash.com/photo-1559202848-9a3f3d5d3dd3?auto=format&fit=crop&w=800&q=60',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final products = sampleProducts;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
