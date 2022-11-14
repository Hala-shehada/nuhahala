class RealModel {
  final String title;
  final String imagePath;
  final String location;
  final String price;

  RealModel({
    required this.title,
    required this.imagePath,
    required this.location,
    required this.price,
  });

  static List<RealModel> realModel = [
    RealModel(
      title: 'Cassablanca Ground Canyon',
      imagePath: 'pic1.jpg',
      location: 'House in California',
      price: '\$2,875,870',
    ),
    RealModel(
      title: 'Modern',
      imagePath: 'pic2.jpg',
      location: 'House in California',
      price: '\$3,575,870',
    ),
    RealModel(
      title: 'Luger Burger',
      imagePath: 'pic3.jpg',
      location: 'House in California',
      price: '\$2,555,000',
    ),
  ];
}
