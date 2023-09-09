import 'package:delete_this/cart_page/cart_page_bloc.dart';
import 'package:delete_this/cart_page/cart_page_event.dart';
import 'package:delete_this/cart_page/cart_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  @override
  Widget build(BuildContext context) {
    var cartBloc = context.read<CartPageBloc>();
    cartBloc.add(LoadCart());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Cart'),
        ),
      ),
      body: BlocBuilder<CartPageBloc, CartPageState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              var product = state.cartItems.keys.elementAt(index);
              var value = state.cartItems[product];
              return ListTile(
                onTap: () {
                  setState(() {});
                  cartBloc.add(RemoveFromCart(product: product));
                },
                title: Text(product.name),
                trailing: Text(value.toString()),
                subtitle: Text(product.price.toString()),
              );
            },
            itemCount: state.cartItems.length,
          );
        },
      ),
    );
  }
}
