class OrderModel {
  String? id;
  bool? isActive;
  double? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  String? date;

  OrderModel({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    OrderModel order = OrderModel();
    order.id = json['id'];
    order.isActive = json['isActive'];
    order.price = double.parse(json['price']);
    order.company = json['company'];
    order.picture = json['picture'];
    order.buyer = json['buyer'];
    order.tags = json['tags'];
    order.status = json['status'];
    order.date = json['registered'];
    return order;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isActive'] = isActive;
    data['price'] = price;
    data['company'] = company;
    data['picture'] = picture;
    data['buyer'] = buyer;
    data['tags'] = tags;
    data['status'] = status;
    data['registered'] = date;
    return data;
  }
}
