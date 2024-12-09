import 'package:water/Base/network/network-mappers.dart';

class ClientsModel extends BaseMappable{
  String? jsonrpc;
  String? id;
  Result? result;

  ClientsModel({this.jsonrpc, this.id, this.result});

  ClientsModel.fromJson(Map<String, dynamic> json) {
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
    return ClientsModel(jsonrpc: jsonrpc,result: result,id: id);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  List<Client>? clients;

  Result({this.statusCode, this.isError, this.message, this.clients});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    if (json['result'] != null) {
      clients = <Client>[];
      json['result'].forEach((v) {
        clients!.add(Client.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.clients != null) {
      data['result'] = this.clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Client {
  int? customerId;
  String? customerName;
  double? totalAmountDue;
  double? totalAmount;

  Client(
      {this.customerId,
        this.customerName,
        this.totalAmountDue,
        this.totalAmount});

  Client.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    totalAmountDue = json['total_amount_due'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['total_amount_due'] = this.totalAmountDue;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}