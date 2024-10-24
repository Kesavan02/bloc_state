part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class ProductRemoveFromCartEvent extends CartEvent {}
