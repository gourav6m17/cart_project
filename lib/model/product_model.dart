
class Product{
  String? id;
  String title;
  String category;
  String description;
  double price;
  int count;
  String img;


  Product({
    this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.count,
    required this.img,
  });

  factory Product.fromMap(var data) {
    return Product(
        id: data['id'] ?? '',
        title: data['name'] ?? '',
        category: data['categoryId'] ?? '',
        description: data['description'] ?? '',
      price: data['price'] ?? '',
      count: data['count'] ?? 0,
      img: data['url'] ?? [],
    );
  }
}
