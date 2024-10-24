import 'package:bloc_state/home/bloc/home_bloc.dart';
import 'package:bloc_state/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatefulWidget {
  final HomeScreenBloc homeScreenBloc;
  final ProductDataModel productDataModel;
  const ProductTileWidget(
      {super.key,
      required this.productDataModel,
      required this.homeScreenBloc});

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  Color wishlistIconColor = Colors.white;
  Color cartIconColor = Colors.white;

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
          Container(
            height: 170,
            width: double.maxFinite,
            decoration: const BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.productDataModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.productDataModel.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(widget.productDataModel.category),
          Row(
            children: [
              Text('\$  ${widget.productDataModel.price}'),
              const Spacer(
                flex: 17,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      wishlistIconColor = Colors.red;
                    });
                    widget.homeScreenBloc.add(
                        HomeProductWishlistButtonClickedEvent(
                            clickedProduct: widget.productDataModel));
                  },
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: wishlistIconColor,
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      cartIconColor = Colors.blue;
                    });
                    widget.homeScreenBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: widget.productDataModel));
                  },
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                    color: cartIconColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
