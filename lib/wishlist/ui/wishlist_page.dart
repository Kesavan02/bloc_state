import 'package:bloc_state/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_state/wishlist/ui/wishlist_tile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState _:
              final successState = state as WishlistSuccessState;
              if (successState.wishlistItems.isEmpty) {
                return const Scaffold(
                  body: Center(
                    child: Text(
                      'Add any items in your wishlist',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else if (successState.wishlistItems.isNotEmpty) {
                return ListView.builder(
                    itemCount: successState.wishlistItems.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                        productDataModel: successState.wishlistItems[index],
                        wishlistBloc: wishlistBloc,
                      );
                    });
              }
            case WishlistErrorState _:
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
    );
  }
}
