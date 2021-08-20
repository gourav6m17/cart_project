class CartItem{
  String id;
  String title;
  int price;
  String count;
  String imgUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.count,
    required this.imgUrl,
  });

  factory CartItem.fromMap(var data) {
    return CartItem(
      id: data['itemId'] ?? '',
      title: data['itemName'] ?? '',
      price: data['itemPrice'] ?? 0.0,
      count: data['itemCount'] ?? '',
      imgUrl: data['itemImgUrl'] ?? '',
    );
  }
  Map<String,dynamic> toMap() {
    return {
      "itemId" : id,
      "itemName" : title,
      "itemPrice" : price,
      "itemWeight" : count,
      "itemImgUrl" : imgUrl,
    };
  }
}