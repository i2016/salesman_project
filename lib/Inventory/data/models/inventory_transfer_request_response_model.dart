import 'package:water/Base/network/network-mappers.dart';

class InventoryTransferRequestResposneModel extends BaseMappable {
  String? jsonrpc;
  String? id;
  Result? result;

  InventoryTransferRequestResposneModel({this.jsonrpc, this.id, this.result});

  InventoryTransferRequestResposneModel.fromJson(Map<String, dynamic> json) {
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
   return InventoryTransferRequestResposneModel(jsonrpc: jsonrpc,id: id,result: result);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  Data? data;

  Result({this.statusCode, this.isError, this.message, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    data =
    json['result'] != null ? new Data.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.data != null) {
      data['result'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? transferId;
  String? transferPrintout;

  Data({this.transferId, this.transferPrintout});

  Data.fromJson(Map<String, dynamic> json) {
    transferId = json['transfer_id'];
    transferPrintout = json['transfer_printout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transfer_id'] = this.transferId;
    data['transfer_printout'] = this.transferPrintout;
    return data;
  }
}