import 'package:water/Base/network/network-mappers.dart';

class TransferRequestsModel extends BaseMappable {
  String? jsonrpc;
  String? id;
  Result? result;

  TransferRequestsModel({this.jsonrpc, this.id, this.result});

  TransferRequestsModel.fromJson(Map<String, dynamic> json) {
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
    return TransferRequestsModel(id: id,result: result,jsonrpc: jsonrpc);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  List<TransferRequest>? transferRequests;

  Result({this.statusCode, this.isError, this.message, this.transferRequests});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    if (json['result'] != null) {
      transferRequests = <TransferRequest>[];
      json['result'].forEach((v) {
        transferRequests!.add(new TransferRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.transferRequests != null) {
      data['result'] = this.transferRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransferRequest {
  int? transferId;
  String? transferName;
  String? transferDate;
  String? transferStatus;
  int? items;
  double? itemsPrice;
  String? transfer_printout;
  TransferRequest(
      {this.transferId,
        this.transferName,
        this.transferDate,
        this.transferStatus,
        this.items,
        this.itemsPrice,this.transfer_printout});

  TransferRequest.fromJson(Map<String, dynamic> json) {
    transferId = json['transfer_id'];
    transferName = json['transfer_name'];
    transferDate = json['transfer_date'];
    transferStatus = json['transfer_status'];
    items = json['items'];
    itemsPrice = json['items_price'];
    transfer_printout = json['transfer_printout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transfer_id'] = this.transferId;
    data['transfer_name'] = this.transferName;
    data['transfer_date'] = this.transferDate;
    data['transfer_status'] = this.transferStatus;
    data['items'] = this.items;
    data['items_price'] = this.itemsPrice;
    data['transfer_printout'] = this.transfer_printout;

    return data;
  }
}