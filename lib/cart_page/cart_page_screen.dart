import 'package:delete_this/cart_page/cart_page_bloc.dart';
import 'package:delete_this/cart_page/cart_page_event.dart';
import 'package:delete_this/cart_page/cart_page_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartPageBloc>();
    cartBloc.add(LoadCart());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: BlocBuilder<CartPageBloc, CartPageState>(
        builder: (context, state) {
          var len = Cart.instanceOfCart.cartItems.length;
          return ListView.builder(
              itemBuilder: (context, index) {
                var product = state.cartItems.keys.elementAt(index);
                return Card(
                  child: ListTile(
                    onTap: () {
                      cartBloc.add(RemoveItems(
                          product: state.cartItems.keys.elementAt(index)));
                    },
                    title: Text(state.cartItems.keys.elementAt(index).name),
                    subtitle: Text(
                        state.cartItems.keys.elementAt(index).price.toString()),
                    trailing: Text(state.cartItems[product].toString()),
                  ),
                );
              },
              itemCount: len);
        },
      ),
    );
  }
}
