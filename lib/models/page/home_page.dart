// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, avoid_print, unused_label, prefer_const_literals_to_create_immutables, unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/models/page/Cataloglist.dart';
import 'package:flutter_application_1/utilites/routes.dart';
// import 'package:flutter_application_1/page/Cataloglist.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'dart:convert';
// import '../widgets/itemwidget.dart';
import 'package:velocity_x/velocity_x.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool isLoading = true;

  var catalog;
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeddata = jsonDecode(catalogjson);
    var productsdata = decodeddata["Items"];
    CatalogModel.items =
        List.from(productsdata).map((items) => Items.fromMap(items)).toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final cart = (VxState.store as MyStore).cart;
    // final itemlist = List.generate(15, (index) => CatalogModel.items[0]);

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
                backgroundColor: context.theme.primaryColor,
                onPressed: () => Navigator.pushNamed(context, Routes.cartroute),
                child: Icon(CupertinoIcons.cart))
            .badge(
          color: Vx.blue400,
          count: cart.items.length,
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Padding(
            padding: Vx.m24,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHeader(),
                  if (isLoading)
                    CircularProgressIndicator() // Show a loading indicator while data is being loaded
                  else
                    Expanded(
                        child: CatalogList(
                            // catalog: catalog,
                            )),
                  5.heightBox,
                ],
              ),
            ),
          ),
        ),
        drawer: appDrawer(
          child: null,
        ));
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "Cool Drinks".text.xl5.bold.color(context.primaryColor).make(),
     
        "Best selling Drinks in India!!"
            .text
            .xl2
            .bold
            .color(context.primaryColor)
            .make(),
        10.heightBox,
      ],
    );
  }
}
