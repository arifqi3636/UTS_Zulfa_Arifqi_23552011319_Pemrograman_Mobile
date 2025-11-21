// lib/blocs/cart_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/product_model.dart';
import '../models/cart_item.dart';

class CartState extends Equatable {
  // map dari productId -> CartItem
  final Map<String, CartItem> items;

  const CartState({required this.items});

  factory CartState.initial() => const CartState(items: {});

  CartState copyWith({Map<String, CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addToCart(ProductModel product) {
    final Map<String, CartItem> updated = Map.from(state.items);
    if (updated.containsKey(product.id)) {
      updated[product.id]!.quantity += 1;
    } else {
      updated[product.id] = CartItem(product: product, quantity: 1);
    }
    emit(state.copyWith(items: updated));
  }

  void removeFromCart(ProductModel product) {
    final Map<String, CartItem> updated = Map.from(state.items);
    updated.remove(product.id);
    emit(state.copyWith(items: updated));
  }

  void updateQuantity(ProductModel product, int qty) {
    if (qty <= 0) {
      removeFromCart(product);
      return;
    }
    final Map<String, CartItem> updated = Map.from(state.items);
    if (updated.containsKey(product.id)) {
      updated[product.id]!.quantity = qty;
      emit(state.copyWith(items: updated));
    } else {
      updated[product.id] = CartItem(product: product, quantity: qty);
      emit(state.copyWith(items: updated));
    }
  }

  int getTotalItems() {
    return state.items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  int getTotalPrice() {
    return state.items.values.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void clearCart() {
    emit(state.copyWith(items: {}));
  }
}
