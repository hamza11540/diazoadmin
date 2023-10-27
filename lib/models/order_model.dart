import 'package:flutter_auth/models/voucher_model.dart';

class OrdersModel {
  List<CartItemModel>? items;
  String? user;
  String? userName;
  String? address;
  String? instructions;
  String? branch;
  String? paymentType;
  String? fcmToken;
  double? totalPrice;
  double? deliveryCharges;
  double? latitude;
  double? longitude;
  int? totalItems;
  int? deliveryTime;
  DateTime? dateTime;
  String? orderId;
  String? status;
  String? orderCategory;
  String? userPhone;
  bool? isViewed;
  bool? isVoucherApplied;
  VoucherModel? voucher;

  OrdersModel(
      this.items,
      this.user,
      this.deliveryTime,
      this.instructions,
      this.isVoucherApplied,
      this.fcmToken,
      this.voucher,
      this.userPhone,
      this.isViewed,
      this.userName,
      this.totalPrice,
      this.totalItems,
      this.dateTime,
      this.orderId,
      this.address,
      this.status,
      this.deliveryCharges,
      this.longitude,
      this.latitude,
      this.branch);

  OrdersModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] ?? '';
    userName = json['userName'] ?? '';
    address = json['address'] ?? '';
    instructions = json['instructions'] ?? '';
    paymentType = json['paymentType'] ?? '';
    branch = json['branch'] ?? '';
    isViewed = json['isViewed'] ?? false;
    fcmToken = json['userFcmToken'];
    orderCategory = json['orderCategory'] ?? '';
    orderId = json['id'] ?? '';
    status = json['status'] ?? '';
    userPhone = json['userPhone'] ?? '--';
    totalPrice = json['totalPrice'] ?? 0.0;
    if (json['deliveryCharges'] is int) {
      deliveryCharges = double.parse(json['deliveryCharges'].toString());
    } else {
      deliveryCharges = json['deliveryCharges'] ?? 0.0;
    }
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
    totalItems = json['totalItems'] ?? 0;
    deliveryTime = json['deliveryTime'] ?? 30;
    isVoucherApplied = json['isVoucherApplied'] ?? false;
    voucher =
    json['voucher'] != null ? VoucherModel.fromJson(json['voucher']) : null;
    dateTime = DateTime.fromMicrosecondsSinceEpoch(
        json['dateTime'].microsecondsSinceEpoch) /*json['dateTime']*/;
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(CartItemModel.fromJson(v));
      });
    } else {
      items = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPrice'] = totalPrice;
    data['deliveryCharges'] = deliveryCharges;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['isViewed'] = isViewed;
    data['orderId'] = orderId;
    data['status'] = status;
    data['instructions'] = instructions;
    data['paymentType'] = paymentType;
    data['userFcmToken'] = fcmToken;
    data['address'] = address;
    data['deliveryTime'] = deliveryTime;
    data['user'] = user;
    data['orderCategory'] = orderCategory;
    data['branch'] = branch;
    data['userPhone'] = userPhone;
    data['userName'] = userName;
    data['isVoucherApplied'] = isVoucherApplied;
    data['voucher'] = voucher?.toJson();
    data['totalItems'] = totalItems;
    data['dateTime'] = dateTime;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class CartItemModel {
  String? name;
  String? description;
  int? categoryId;
  int? discount;
  int? points;
  int? quantity;
  bool? isDiscounted;
  List<String>? itemImages;
  ItemSize? size;

  CartItemModel({
    this.name,
    this.description,
    this.categoryId,
    this.discount,
    this.points,
    this.quantity,
    this.isDiscounted,
    this.itemImages,
    this.size,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    categoryId = json['categoryId'];
    discount = json['discount'];
    quantity = json['quantity'];
    points = json['points'] ?? 0;
    isDiscounted = json['isDiscounted'];
    if (json['itemImages'] != null) {
      itemImages = [];
      json['itemImages'].forEach((v) {
        itemImages!.add(v);
      });
    }
    if (json['sizes'] != null) {
      size = ItemSize.fromJson(json['sizes']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['categoryId'] = categoryId;
    data['discount'] = discount;
    data['points'] = points;
    data['quantity'] = quantity;
    data['isDiscounted'] = isDiscounted;
    if (itemImages != null) {
      data['itemImages'] = itemImages!.map((v) => v).toList();
    }
    if (size != null) {
      data['sizes'] = size!.toJson();
    }
    return data;
  }
}

class ItemSize {
  String? size;
  double? discountedPrice;
  double? price;

  ItemSize.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    // discountedPrice = json['discountedPrice'] ?? json['price'];
    if (json['discountedPrice'] is int) {
      discountedPrice = double.parse(json['discountedPrice'].toString());
    }
    // if(json['price'] != null){
    //   if(json['price'] is int){
    //     price = double.parse(json['price'].toString());
    //   }
    // }else{
    //   price = json['price'];
    // }
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['discountedPrice'] = discountedPrice;
    data['price'] = price;
    return data;
  }
}