import 'package:water/Base/network/network-mappers.dart';

class ProductModel extends BaseMappable {
  String? jsonrpc;
  String? id;
  Result? result;

  ProductModel({this.jsonrpc, this.id, this.result});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
    return ProductModel(id: id,jsonrpc: jsonrpc,result: result);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  List<Product>? products;

  Result({this.statusCode, this.isError, this.message, this.products});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    if (json['result'] != null) {
      products = <Product>[];
      json['result'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.products != null) {
      data['result'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  double? one_price;
  String? image;
  String? count;
  int? mainUomId;
  String? mainUomName;
  List<UomIds>? uomIds;
  Product({this.id, this.name, this.description, this.price,this.one_price, this.image,this.count});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    one_price = json['one_price'];
    image = json['image'];
    count = json['on_hand'].toString()??20.toString();
    mainUomId = json['main_uom_id'];
    mainUomName = json['main_uom_name'];
    if (json['uom_ids'] != null) {
      uomIds = <UomIds>[];
      json['uom_ids'].forEach((v) {
        uomIds!.add(new UomIds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['one_price'] = this.one_price;
    data['image'] = this.image;
    data['on_hand'] = this.count;
    data['main_uom_id'] = this.mainUomId;
    data['main_uom_name'] = this.mainUomName;
    if (this.uomIds != null) {
      data['uom_ids'] = this.uomIds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UomIds {
  int? id;
  String? name;

  UomIds({this.id, this.name});

  UomIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}