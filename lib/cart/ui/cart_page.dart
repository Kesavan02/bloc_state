import 'package:bloc_state/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Cart Items'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState _:
                final successState = state as CartSuccessState;
                if (successState.cartItems.isEmpty) {
                  return const Scaffold(
                    body: Center(
                      child: Text(
                        'Add any items in your cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                } else if (successState.cartItems.isNotEmpty) {
                  return ListView.builder(
                      itemCount: successState.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartTileWidget(
                          productDataModel: successState.cartItems[index],
                          cartBloc: cartBloc,
                        );
                      });
                }
              case CartErrorState _:
                return const Scaffold(
                  body: Center(
                    child: Text('Error'),
                  ),
                );
              default:
                return const SizedBox();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
