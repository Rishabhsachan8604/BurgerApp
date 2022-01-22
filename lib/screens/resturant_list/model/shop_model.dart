class ShopModel {
  final String categoryName;
  final String categoryImage;
  final List<Product> products;
  double position = 0;

  ShopModel({required this.categoryName,required this.categoryImage, required this.products});
}

class Product {
  final String image;
  final String name;
  final double price;

  Product(this.image, this.name, this.price);
}
