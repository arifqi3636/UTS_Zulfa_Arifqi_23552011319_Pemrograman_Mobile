// lib/pages/cart_summary_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';
import '../models/cart_item.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ringkasan Keranjang")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final items = state.items.values.toList();
          final totalItems = context.read<CartCubit>().getTotalItems();
          final totalPrice = context.read<CartCubit>().getTotalPrice();

          if (items.isEmpty) {
            return const Center(
              child: Text('Keranjang kosong', style: TextStyle(fontSize: 18)),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final CartItem item = items[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: SizedBox(
                          width: 56,
                          height: 56,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(item.product.name),
                        subtitle: Text("Rp ${item.product.price}"),
                        trailing: SizedBox(
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  final newQty = item.quantity - 1;
                                  context.read<CartCubit>().updateQuantity(
                                    item.product,
                                    newQty,
                                  );
                                },
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                onPressed: () {
                                  final newQty = item.quantity + 1;
                                  context.read<CartCubit>().updateQuantity(
                                    item.product,
                                    newQty,
                                  );
                                },
                                icon: const Icon(Icons.add_circle_outline),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<CartCubit>().removeFromCart(
                                    item.product,
                                  );
                                },
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemCount: items.length,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: const [
                    BoxShadow(blurRadius: 6, color: Colors.black12),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Item: $totalItems',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Total Harga: Rp $totalPrice',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Simpel: checkout akan mengosongkan cart
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Checkout'),
                            content: const Text(
                              'Anda yakin ingin checkout? Keranjang akan dikosongkan.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Batal'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CartCubit>().clearCart();
                                  Navigator.pop(ctx);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Checkout berhasil — keranjang dikosongkan',
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Ya, Checkout'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
