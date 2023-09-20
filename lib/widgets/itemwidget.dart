// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class Itemwidget extends StatelessWidget {
  final Items items;

  const Itemwidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // shape: Border(),
      child: ListTile(
        onTap: () {},
        leading: Image.network(items.imageurl),
        title: Text(items.name),
        subtitle: Text(items.desc),
        trailing: Text(
          "Rs. ${items.price.toString()}",
          textScaleFactor: 1.2,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
