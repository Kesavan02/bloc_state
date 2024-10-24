import 'package:bloc_state/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

import '../../home/models/home_product_data_model.dart';

class WishlistTileWidget extends StatelessWidget {
  const WishlistTileWidget(
      {super.key, required this.wishlistBloc, required this.productDataModel});

  final WishlistBloc wishlistBloc;

  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            width: double.maxFinite,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                productDataModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.category),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text('\$ ${productDataModel.price}'),
              const Spacer(
                flex: 17,
              ),
              IconButton(
                  onPressed: () {
                    //cartBloc.add(HomeProductWishlistButtonClickedEvent(
                    //clickedProduct: productDataModel));
                  },
                  icon: const Icon(Icons.favorite_rounded)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    //homeScreenBloc.add(HomeProductCartButtonClickedEvent(
                    // clickedProduct: productDataModel));
                  },
                  icon: const Icon(Icons.shopping_bag_rounded)),
            ],
          )
        ],
      ),
    );
  }
}
