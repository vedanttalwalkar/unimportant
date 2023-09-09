import 'package:delete_this/cart_page/cart_page_bloc.dart';
import 'package:delete_this/cart_page/cart_page_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: ((context) {
      return CartPageBloc();
    }
    ),
    child:const CartPageScreen(),
    );
  }
}
