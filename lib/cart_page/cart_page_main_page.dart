import 'package:delete_this/cart_page/cart_page_bloc.dart';
import 'package:delete_this/cart_page/cart_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageMainPage extends StatelessWidget {
  const CartPageMainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CartPageBloc();
      },
      child: CartPageScreen(),
    );
  }
}
