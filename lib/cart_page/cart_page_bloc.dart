import 'package:delete_this/cart_page/cart_page_event.dart';
import 'package:delete_this/cart_page/cart_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';

class CartPageBloc extends Bloc<CartPageEvent, CartPageState> {
  CartPageBloc() : super(const CartPageState(cartItems: {}, version: 1)) {
    var cartItems = Cart.instanceOfCart.cartItems;
    on<LoadCart>((event, emit) {
      emit(state.exchangeWith(cartItems: cartItems));
    });
    on<FilterCart>((event, emit) {
      var filteredCart = {};
      cartItems.forEach((key, value) {
        bool meetsMaxValueCondition =
            event.maxValue == null || event.maxValue! > key.price;
        bool meetsMinValueCondition =
            event.minValue == null || event.minValue! < key.price;
        if (meetsMinValueCondition && meetsMaxValueCondition) {
          filteredCart[key] = value;
        }
      });
    });

    on<RemoveFromCart>(
      (event, emit) {
        Cart.instanceOfCart.removeFromCart(event.product);
        emit(state.exchangeWith(cartItems: Cart.instanceOfCart.cartItems));
      },
    );
  }
}
