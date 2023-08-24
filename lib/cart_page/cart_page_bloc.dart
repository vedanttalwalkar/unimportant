import 'dart:collection';

import 'package:delete_this/cart_page/cart_page_event.dart';
import 'package:delete_this/cart_page/cart_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';

class CartPageBloc extends Bloc<CartPageEvent, CartPageState> {
  CartPageBloc() : super(const CartPageState(cartItems: {})) {
    on<LoadCart>(
      (event, emit) {
        emit(state.exchangeWith(cartItems: Cart.instanceOfCart.cartItems));
      },
    );
    on<RemoveItems>((event, emit) {
      Cart.instanceOfCart.removeFromCart(event.product);

      emit(state.exchangeWith(cartItems: Cart.instanceOfCart.cartItems));
    });
    on<SortAscending>(
      (event, emit) {
        var filteredCartItems = SplayTreeMap<Product, int>.from(
            Cart.instanceOfCart.cartItems,
            ((a, b) => a.price.compareTo(b.price)));

        emit(state.exchangeWith(cartItems: filteredCartItems, ascending: true));
      },
    );
  }
}
