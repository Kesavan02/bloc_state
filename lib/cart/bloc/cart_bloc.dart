import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state/data/cart_items.dart';
import 'package:bloc_state/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<ProductRemoveFromCartEvent>(productRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> productRemoveFromCartEvent(
      ProductRemoveFromCartEvent event, Emitter<CartState> emit) {
        
      }
}
