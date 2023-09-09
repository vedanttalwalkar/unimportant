import 'package:equatable/equatable.dart';

import '../product.dart';

class CartPageState extends Equatable {
  final int version;
  final Map<Product, int> cartItems;
  final int? maxValue;
  final int? minValue;
  const CartPageState(
      {required this.version,
      required this.cartItems,
      this.maxValue,
      this.minValue});

  CartPageState exchangeWith(
      {required Map<Product, int> cartItems, int? maxValue, int? minValue}) {
    return CartPageState(
        version: version + 1,
        cartItems: cartItems,
        maxValue: maxValue ?? this.maxValue,
        minValue: minValue ?? this.minValue);
  }

  @override
  List<Object?> get props => [cartItems, maxValue, minValue, version];
}
