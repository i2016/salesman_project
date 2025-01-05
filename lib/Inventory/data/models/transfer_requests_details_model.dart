import 'package:water/Base/network/network-mappers.dart';

class TransferRequestsDetailsModel extends BaseMappable{
  String? jsonrpc;
  String? id;
  Result? result;

  TransferRequestsDetailsModel({this.jsonrpc, this.id, this.result});

  TransferRequestsDetailsModel.fromJson(Map<String, dynamic> json) {
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
    return TransferRequestsDetailsModel(jsonrpc: jsonrpc,result: result,id: id);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  TransferRequestsDetails? transferRequestsDetails;

  Result({this.statusCode, this.isError, this.message, this.transferRequestsDetails});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    transferRequestsDetails =
    json['result'] != null ? new TransferRequestsDetails.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.transferRequestsDetails != null) {
      data['result'] = this.transferRequestsDetails!.toJson();
    }
    return data;
  }
}

class TransferRequestsDetails {
  int? transferId;
  String? transferName;
  String? transferDate;
  String? transferStatus;
  String? transfer_printout;
  List<Items>? items;

  TransferRequestsDetails(
      {this.transferId,
        this.transferName,
        this.transferDate,
        this.transferStatus,
        this.transfer_printout,
        this.items});

  TransferRequestsDetails.fromJson(Map<String, dynamic> json) {
    print("json['transfer_printout'] : ${json['transfer_printout']}");
    transferId = json['transfer_id'];
    transferName = json['transfer_name'];
    transferDate = json['transfer_date'];
    transfer_printout = json['transfer_printout'];
    transferStatus = json['transfer_status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transfer_id'] = this.transferId;
    data['transfer_name'] = this.transferName;
    data['transfer_date'] = this.transferDate;
    data['transfer_status'] = this.transferStatus;
    data['transfer_printout'] = this.transfer_printout;

    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? productId;
  String? productName;
  String? productDescription;
  String? productCategory;
  double? productPrice;
  double? quantity;
  String? uom_name;
  int? uom_id;

  Items(
      {this.productId,
        this.productName,
        this.productDescription,
        this.productCategory,
        this.productPrice,
        this.quantity,
      this.uom_name,this.uom_id});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productCategory = json['product_category'];
    productPrice = json['product_price'];
    quantity = json['quantity'];
    uom_name = json['uom_name'];
    uom_id = json['uom_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['product_category'] = this.productCategory;
    data['product_price'] = this.productPrice;
    data['quantity'] = this.quantity;
    data['uom_name'] = this.uom_name;
    data['uom_id'] = this.uom_id;
    return data;
  }
}