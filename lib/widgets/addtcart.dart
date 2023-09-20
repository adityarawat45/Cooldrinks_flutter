// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart_model.dart';
import '../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;

  AddToCart(this.catalog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    bool isInCart = cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(10, 35)),
        backgroundColor:
            MaterialStateProperty.all(context.theme.unselectedWidgetColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    ).pOnly(right: 20);
  }
}
