import 'package:equatable/equatable.dart';
import '../product.dart';

class CartPageState extends Equatable {
  final Map<Product, int> cartItems;
  final double? totalAmount;
  final bool? ascending;
  const CartPageState({
    this.totalAmount,
    this.ascending,
    required this.cartItems,
  });
  @override
  List<Object?> get props => [totalAmount, ascending, cartItems];

  CartPageState exchangeWith(
      {double? totalAmount, bool? ascending, Map<Product, int>? cartItems}) {
    return CartPageState(
        cartItems: cartItems ?? this.cartItems,
        totalAmount: totalAmount ?? this.totalAmount,
        ascending: ascending ?? this.ascending);
  }
}
