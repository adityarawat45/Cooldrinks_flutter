// ignore_for_file: camel_case_types, unnecessary_import, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/models/page/Cataloglist.dart';
import 'package:flutter_application_1/widgets/addtcart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class homedtl extends StatelessWidget {
  final Items item;
  const homedtl({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(CupertinoIcons.cart),
        // ),
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(item.id.toString()),
                      child: Image.network(item.imageurl))
                  .h24(context),
              Expanded(
                  child: VxArc(
                      height: 30,
                      arcType: VxArcType.convey,
                      edge: VxEdge.top,
                      child: Container(
                        width: context.screenWidth,
                        color: context.canvasColor,
                        child: Column(
                          children: [
                            40.heightBox,
                            item.name.text.xl4
                                .color(context.theme.indicatorColor)
                                .bold
                                .make(),
                            5.heightBox,
                            item.desc.text.xl
                                .color(context.theme.indicatorColor)
                                .textStyle(context.captionStyle)
                                .make(),
                            10.heightBox,
                            "This Summer Season,try the ${item.name} drink and give yourself a mindblowing refreshing experience.${item.name} consists of a lot of natural ingredients with very less artificial flavours that are also not a worry kind of thing for your health.So what are you thinking?Just order ${item.name} for ₹${item.price} only."
                                .text
                                .center
                                .color(context.theme.indicatorColor)
                                .make()
                                .p16(),
                          ],
                        ),
                      )))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            // buttonPadding: Vx.mOnly(right: 15),
            children: [
              "₹${item.price}"
                  .text
                  .xl3
                  .color(context.theme.indicatorColor)
                  .make()
                  .pOnly(left: 12),
              AddToCart(item)
            ],
          ).pOnly(right: 12),
        ));
  }
}
