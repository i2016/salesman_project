import 'package:water/Base/network/network-mappers.dart';

class ClientAddRequestsModel extends BaseMappable {
  String? jsonrpc;
  String? id;
  Result? result;

  ClientAddRequestsModel({this.jsonrpc, this.id, this.result});

  ClientAddRequestsModel.fromJson(Map<String, dynamic> json) {
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
    return ClientAddRequestsModel(id: id, result: result, jsonrpc: jsonrpc);
  }
}
class Result {
  int? statusCode;
  bool? isError;
  String? message;
  List<ClientStatus>? clientStatus;

  Result({this.statusCode, this.isError, this.message, this.clientStatus});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    if (json['result'] != null) {
      clientStatus = <ClientStatus>[];
      json['result'].forEach((v) {
        clientStatus!.add(new ClientStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.clientStatus != null) {
      data['result'] = this.clientStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientStatus {
  int? customerId;
  String? date;
  String? customerName;
  String? status;

  ClientStatus({this.customerId, this.date, this.customerName, this.status});

  ClientStatus.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    date = json['date'];
    customerName = json['customer_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['date'] = this.date;
    data['customer_name'] = this.customerName;
    data['status'] = this.status;
    return data;
  }
}