class CatalogModel {
  static List<Items> items = items;
  static Items getById(num id) =>
      // ignore: null_closures
      items.firstWhere((element) => element.id == id, orElse: null);

  // static Items getByPosition(int pos) => items[pos];
}

class Items {
  num id;
  String name;
  String desc;
  num price;
  String color;
  String imageurl;

  Items(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageurl});

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageurl: map["imageurl"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "imageurl": imageurl,
      };
}
