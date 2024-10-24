import 'package:bloc_state/cart/ui/cart_page.dart';
import 'package:bloc_state/data_table.dart';
import 'package:bloc_state/home/bloc/home_bloc.dart';
import 'package:bloc_state/home/ui/product_tile_widget.dart';
import 'package:bloc_state/json_data.dart';
import 'package:bloc_state/wishlist/ui/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color iconColor = Colors.white;

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeScreenBloc homeBloc = HomeScreenBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Wishlist()));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item Wishlisted Successfully')));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Item Carted Successfully')),
          );
        }else if(state is HomeNavigateToDataTableActionState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyDataTable()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState) :
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal[400],
                elevation: 10,
                title: const Text(
                  'Theme Data',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                leading: IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ItemWidget()));
                },icon: const Icon(Icons.add_alarm_sharp),),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateClickedEvent());
                    },
                    icon: Icon(
                      Icons.heart_broken_rounded,
                      color: iconColor,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateClickedEvent());
                      },
                      icon: const Icon(Icons.shopping_cart_rounded))
                ],
              ),
              floatingActionButton: FloatingActionButton(onPressed: (){
                homeBloc.add(HomeFloatingActionButtonNavigateClickedEvent());
              }),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      productDataModel: successState.products[index],
                      homeScreenBloc: homeBloc,
                    );
                  }),
            ); 
          case const (HomeErrorState):
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return Container(
              decoration: const BoxDecoration(color: Colors.purple),
            );
        }
      },
    );
  }
}
