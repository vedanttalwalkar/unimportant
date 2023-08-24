import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final int category;
  final double price;
  final String pictureUrl;
  const Product(this.name, this.category, this.pictureUrl, this.price);

  @override
  List<Object?> get props => [name, category, pictureUrl, price];
}

class Cart {
  Map<Product, int> cartItems = {};
  static final instanceOfCart = Cart._();
  Cart._();

  void addToCart(Product product) {
    var cartItems = Cart.instanceOfCart.cartItems;
    if (cartItems.containsKey(product)) {
      Cart.instanceOfCart.cartItems[product] =
          Cart.instanceOfCart.cartItems[product]! + 1;
    } else {
      Cart.instanceOfCart.cartItems[product] = 1;
    }
  }

  void removeFromCart(Product product) {
    if (Cart.instanceOfCart.cartItems.containsKey(product)) {
      if (Cart.instanceOfCart.cartItems[product] == 1) {
        Cart.instanceOfCart.cartItems.remove(product);
      } else {
        Cart.instanceOfCart.cartItems[product] =
            Cart.instanceOfCart.cartItems[product]! - 1;
      }
    }
  }
}
