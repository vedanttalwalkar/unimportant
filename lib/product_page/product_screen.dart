import 'package:delete_this/cart_page/cart_page_main.dart';
import 'package:delete_this/product_page/product_bloc.dart';
import 'package:delete_this/product_page/product_event.dart';
import 'package:delete_this/product_page/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductMainScreen extends StatefulWidget {
  const ProductMainScreen({super.key});

  @override
  State<ProductMainScreen> createState() => _ProductMainScreenState();
}

class _ProductMainScreenState extends State<ProductMainScreen> {
  String value = '';
  OutlineInputBorder textFieldKa = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 3,
    ),
  );
  List<String> categoryList = [
    'Food Essentials',
    'Bath',
    'Snacks',
    'Toys',
    'Washroom',
    'Clothes',
    'Electronics',
    'Furniture',
    'All'
  ];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    productBloc.add(LoadProducts());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 239),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
        centerTitle: true,
        title: const Text('EasyBuy'),
      ),
      body: BlocBuilder<ProductBloc, ProductListState>(
        builder: (context, state) => Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: textEditingController,
                            onChanged: (value) {
                              this.value = value;
                              productBloc.add(ApplyFilters(
                                  sliderValue: state.sliderValue,
                                  name: value,
                                  category: state.categoryFilter,
                                  maxPrice: state.maxPriceFilter));
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                enabledBorder: textFieldKa,
                                border: textFieldKa,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                hintText: 'Kya Chahiye Aapko',
                                disabledBorder: textFieldKa,
                                focusedBorder: textFieldKa,
                                errorBorder: textFieldKa),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                          min: 0,
                          max: 25000,
                          activeColor: Colors.blue,
                          inactiveColor: const Color.fromARGB(255, 3, 244, 236),
                          value: state.sliderValue ?? 25000,
                          onChanged: (value) {
                            productBloc.add(ApplyFilters(
                                sliderValue: value,
                                name: state.nameFilter,
                                maxPrice: value,
                                category: state.categoryFilter));
                          }),
                    ),
                    Text(state.sliderValue != null
                        ? state.sliderValue!.toStringAsFixed(2)
                        : '25000')
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return TextButton(
                          onPressed: () {
                            productBloc.add(ApplyFilters(
                                sliderValue: state.sliderValue,
                                category: index,
                                name: state.nameFilter,
                                maxPrice: state.maxPriceFilter));
                          },
                          child: Text(categoryList[index]),
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 3,
                        );
                      },
                      itemCount: categoryList.length),
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return Card(
                            child: ListTile(
                              trailing: SizedBox(
                                width: 90,
                                child: Row(
                                  children: [
                                    IconButton.filled(
                                        onPressed: () {
                                          productBloc.add(RemoveItems(product));
                                        },
                                        icon: const Icon(Icons.remove)),
                                    IconButton.filled(
                                        onPressed: () {
                                          productBloc.add(AddItems(product));
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              ),
                              onTap: () {
                                productBloc.add(AddItems(product));
                              },
                              title: Text(product.name),
                              subtitle: Text(product.price.toStringAsFixed(1)),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            endIndent: 8,
                            indent: 8,
                          );
                        },
                        itemCount: state.products.length))
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CartPage();
                  }));
                },
                icon: const Icon(Icons.shopping_bag)),
          ],
        ),
      ),
    );
  }
}
