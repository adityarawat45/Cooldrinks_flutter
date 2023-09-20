// ignore_for_file: file_names, unused_import, camel_case_types, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/page/homedetail_page.dart';
// import 'package:flutter_application_1/page/homedetail_page.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/addtcart.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({super.key});

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(
          catalog: catalog,
        );
      },
    );
  }
}

class CatalogItem extends StatefulWidget {
  final Items catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  State<CatalogItem> createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => homedtl(
                    item: widget.catalog,
                  ))),
      child: VxBox(
        child: Row(children: [
          Hero(
              tag: Key(widget.catalog.id.toString()),
              child: CatalogImage(image: widget.catalog.imageurl)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              8.heightBox,
              widget.catalog.name.text
                  .color(context.theme.indicatorColor)
                  .bold
                  .make(),
              widget.catalog.desc.text
                  .color(context.theme.indicatorColor)
                  .textStyle(context.captionStyle)
                  .make(),
              // 2.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                // overflowButtonSpacing: Vx.dp0,
                // buttonPadding: Vx.m8,
                children: [
                  "₹${widget.catalog.price}"
                      .text
                      .color(context.theme.indicatorColor)
                      .make(),
                  AddToCart(widget.catalog),
                ],
              ),
            ],
          )),
        ]),
      ).square(120).roundedLg.color(context.cardColor).make().py8(),
    );
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .wh24(context);
  }
}
