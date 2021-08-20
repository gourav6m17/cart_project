class OrderModel {
  String? id;
  String userId;
  String shippingMethod;
  String paymentMethod;
  String? shippingAddress;
  var products;
  int finalPrice;
  DateTime dateCreated;
  String orderStatus;
  String? comment;

  OrderModel({
    this.id,
    required this.userId,
    required this.shippingMethod,
    required this.paymentMethod,
    this.shippingAddress,
    required this.products,
    required this.finalPrice,
    required this.dateCreated,
    required this.orderStatus,
    this.comment
  });

  factory OrderModel.fromMap(var data) {
    return OrderModel(
      id:  data['id'] ?? '',
      userId: data['userId'] ?? '',
      shippingMethod: data['shippingMethod'] ?? '',
      paymentMethod: data['paymentMethod'] ?? '',
      shippingAddress: data['shippingAddress'] ?? '',
      finalPrice: data['finalPrice'] ?? '',
      dateCreated: data['dateCreated'].toDate() ?? '',
      products: data['items'] ?? [],
      orderStatus: data['orderStatus'],
      comment: data['comment'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "shippingMethod": shippingMethod,
      "paymentMethod": paymentMethod,
      "shippingAddress": shippingAddress,
      "items": products,
      "finalPrice": finalPrice,
      "dateCreated": dateCreated,
      "orderStatus": orderStatus,
      "comment": comment
    };
  }
}