part of 'wishlist_bloc.dart';

abstract class WishlistState {}

abstract class WishlistActionState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

class WishlistErrorState extends WishlistState {}
