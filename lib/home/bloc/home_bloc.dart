import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state/data/cart_items.dart';
import 'package:bloc_state/data/grocery_data.dart';
import 'package:bloc_state/data/wishlist_items.dart';
import 'package:bloc_state/home/models/home_product_data_model.dart';
import 'package:flutter/foundation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeScreenBloc extends Bloc<HomeEvent, HomeState> {
  HomeScreenBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateClickedEvent>(
        homeWishlistButtonNavigateClickedEvent);
    on<HomeCartButtonNavigateClickedEvent>(homeCartButtonNavigateClickedEvent);
    on<HomeFloatingActionButtonNavigateClickedEvent>(homeFloatingActionButtonNavigateClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                category: e['category'],
                price: e['price'],
                stock: e['stock'],
                imageUrl: e['image']))
            .toList()));
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("CartButton is Clicked");
    cartItems.add(event.clickedProduct);
    print(cartItems);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('WishlistButton is Clicked');
    }
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateClickedEvent(
      HomeWishlistButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Page is Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateClickedEvent(
      HomeCartButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Page is Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  Future<void> homeFloatingActionButtonNavigateClickedEvent(HomeFloatingActionButtonNavigateClickedEvent event, Emitter<HomeState> emit)async {
    print('DataTable Page is Clicked');
    emit(HomeNavigateToDataTableActionState());
  }
}
