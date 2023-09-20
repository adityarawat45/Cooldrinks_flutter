// ignore_for_file: unused_import, non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel catalog;

  final List<num> _itemIds = [];

  List<Items> get items =>
      _itemIds.map((id) => CatalogModel.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Items items) {
    _itemIds.add(items.id);
  }

  void remove(Items items) {
    _itemIds.remove(items.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Items items;

  AddMutation(this.items);
  @override
  perform() {
    store!.cart._itemIds.add(items.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Items items;

  RemoveMutation(this.items);
  @override
  perform() {
    store!.cart._itemIds.remove(items.id);
  }
}
