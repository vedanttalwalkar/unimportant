import 'package:equatable/equatable.dart';

import '../product.dart';

class CartPageEvent extends Equatable {
  const CartPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadCart extends CartPageEvent {}

class RemoveFromCart extends CartPageEvent {
  final Product product;

  const RemoveFromCart({required this.product});
  @override
  List<Object?> get props => [product];
}

class FilterCart extends CartPageEvent {
  final double? maxValue;
  final double? minValue;

  const FilterCart({this.maxValue, this.minValue});
  @override
  List<Object?> get props => [maxValue, minValue];
}
