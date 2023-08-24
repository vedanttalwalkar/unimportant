import 'package:delete_this/product.dart';
import 'package:equatable/equatable.dart';

class CartPageEvent extends Equatable {
  const CartPageEvent();

  @override
  List<Object?> get props => [];
}

class LoadCart extends CartPageEvent {}

class RemoveItems extends CartPageEvent {
  final Product product;
  const RemoveItems({required this.product});

  @override
  List<Object?> get props => [product];
}

class SortAscending extends CartPageEvent {
  final bool? sort;
  const SortAscending({this.sort});
  @override
  List<Object?> get props => [sort];
}
