class Product {
  final String imageUrl;
  final String name;
  final double price;
  final double rating;

  Product(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.rating});
}


class ProductConstlist {
  static bool hasItems = false;
  static bool hasProduct = false;
  
  List<Product> product = [
    Product(
        imageUrl:
            "https://www.sefiles.net/images/library/large/trek-slash-9.9-xx-axs-t-type-gen-6-549130-11.png",
        name: "Trek Slash 9.9 XX AXS T-Type Gen 6",
        price: 18000,
        rating: 3),
    Product(
        imageUrl:
            "https://www.sefiles.net/images/library/large/santa-cruz-blur-cc-x0-axs-tr-reserve-iv-809602-1.png",
        name: "Santa Cruz Blur CC X0 AXS TR Reserve",
        price: 14000,
        rating: 45),
    Product(
        imageUrl:
            "https://www.sefiles.net/images/library/large/yeti-cycles-sb165-t2-float-x2-401282-11.jpg",
        name: "Yeti Cycles SB165 T2 FLOAT X2",
        price: 19000,
        rating: 2),
    Product(
        imageUrl:
            "https://www.sefiles.net/images/library/large/trek-fuel-ex-9.9-xtr-gen-6-414512-1.png",
        name: "Trek Fuel EX 9.9 XTR Gen 6",
        price: 20000,
        rating: 1),
    Product(
        imageUrl:
            "https://www.sefiles.net/images/library/large/santa-cruz-tallboy-cc-xx-axs-rsv---2024-457214-3363884-2.png",
        name: "Santa Cruz Tallboy CC XX AXS RSV",
        price: 31000,
        rating: 5),
    Product(
        imageUrl:
            "https://m.media-amazon.com/images/I/716FuJ4En7L._SL1500_.jpg",
        name: "Professional Bike 700 C 27.5T 21/S Cycle",
        price: 40000,
        rating: 4),
    Product(
        imageUrl:
            "https://m.media-amazon.com/images/I/51NFYb0m9aL.jpg",
        name: "Ninety ONE Tracer Racing Bike 700C",
        price: 12000,
        rating: 2),
    Product(
        imageUrl:
            "https://m.media-amazon.com/images/I/61oOBEUQUsL._SL1080_.jpg",
        name: "Ninety ONE Tracer Road Bike R14 700C Multi Speed",
        price: 22000,
        rating: 4.5),
  ];

  String listLink(int index) => product[index].imageUrl;
  String listName(int index) => product[index].name;
  double listPrice(int index) => product[index].price;
}