// ignore_for_file: camel_case_types, unused_import, prefer_const_constructors, unused_element, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        // elevation: 10,
        backgroundColor: const Color.fromARGB(0, 163, 57, 57),
        automaticallyImplyLeading: false,
        title: "Cart"
            .text
            .xl4
            .color(context.primaryColor)
            .center
            .extraBold
            .make()
            .centered(),
      ),
      body: Column(children: [
        CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({super.key});
  final CartModel cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "₹${cart.totalPrice}".text.xl3.color(context.primaryColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        // shape: StadiumBorder(),
                        // actionOverflowThreshold: 1,
                        content:
                            "Buying is not supported as of now!!".text.make()));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.unselectedWidgetColor)),
                  child: "Buy".text.color(context.theme.hoverColor).make())
              .w24(context)
        ],
      ).p32(),
    );
  }
}

class CartList extends StatelessWidget {
  CartList({super.key});
  final CartModel cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;

    return cart.items.isEmpty
        ? "Your Cart is empty!!\nAdd some products"
            .text
            .center
            .xl3
            .caption(context)
            .color(context.primaryColor)
            .makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
                color: context.theme.unselectedWidgetColor,
              ),
              trailing: IconButton(
                icon: Icon(
                  CupertinoIcons.cart_badge_minus,
                  color: context.theme.unselectedWidgetColor,
                ),
                onPressed: () {
                  RemoveMutation(cart.items[index]);
                },
              ),
              title: cart.items[index].name.text.make(),
              textColor: context.primaryColor,
            ),
          );
  }
}
