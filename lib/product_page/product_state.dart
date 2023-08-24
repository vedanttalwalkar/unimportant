import 'package:delete_this/product.dart';
import 'package:equatable/equatable.dart';

class ProductListState extends Equatable {
  final List<Product> products;
  final double? maxPriceFilter;
  final bool? isAscendingNotDescending;
  final String? nameFilter;
  final int? categoryFilter;
  final double? sliderValue;
  final int? lengthofCart;
  const ProductListState({
    this.lengthofCart,
    this.sliderValue,
    this.categoryFilter,
    required this.products,
    this.isAscendingNotDescending,
    this.maxPriceFilter,
    this.nameFilter,
  });


  @override
  List<Object?> get props => [
        products,
        maxPriceFilter,
        isAscendingNotDescending,
        nameFilter,
        categoryFilter,
        sliderValue,
        lengthofCart
      ];

  ProductListState exhangeWith({
    int? lengthofCart,
    double? sliderValue,
    int? categoryFilter,
    List<Product>? products,
    bool? isAscendingNotDescending,
    double? maxPriceFilter,
    String? nameFilter,
  }) {
    return ProductListState(
        lengthofCart: lengthofCart ?? this.lengthofCart,
        sliderValue: sliderValue ?? this.sliderValue,
        products: products ?? this.products,
        isAscendingNotDescending:
            isAscendingNotDescending ?? this.isAscendingNotDescending,
        maxPriceFilter: maxPriceFilter ?? this.maxPriceFilter,
        nameFilter: nameFilter ?? this.nameFilter,
        categoryFilter: categoryFilter ?? this.categoryFilter);
  }
}
