import 'package:equatable/equatable.dart';

import '../product.dart';

class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductListEvent {}

class ApplyFilters extends ProductListEvent {
  final double? maxPrice;
  final String? name;
  final int? category;
  final double? sliderValue;
  const ApplyFilters(
      {this.maxPrice, this.name, this.category, this.sliderValue});
  @override
  List<Object?> get props => [maxPrice, name, category];
}

class AddItems extends ProductListEvent {
  final Product product;
  const AddItems(this.product);
  List<Object?> get props => [product];
}

class RemoveItems extends ProductListEvent {
  final Product product;
  const RemoveItems(this.product);
  List<Object?> get props => [product];
}
