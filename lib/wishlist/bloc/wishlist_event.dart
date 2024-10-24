part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class ProductRemoveFromWishlistEvent extends WishlistEvent {}
