import 'package:water/Base/network/network-mappers.dart';

class InvoicesDetailsModel extends BaseMappable{
  String? jsonrpc;
  String? id;
  Result? result;

  InvoicesDetailsModel({this.jsonrpc, this.id, this.result});

  InvoicesDetailsModel.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    return InvoicesDetailsModel(id: id,jsonrpc: jsonrpc,result: result);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  Details? details;

  Result({this.statusCode, this.isError, this.message, this.details});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    details =
    json['result'] != null ? new Details.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.details != null) {
      data['result'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  List<Items>? items;

  Details({this.items});

  Details.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? productId;
  String? productName;
  double? quantity;
  String? image;

  Items({this.productId, this.productName, this.quantity, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    return data;
  }
}