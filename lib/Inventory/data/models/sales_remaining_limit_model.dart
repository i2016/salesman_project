import 'package:water/Base/network/network-mappers.dart';

class SalesRemainingLimitModel extends BaseMappable{
  String? jsonrpc;
  String? id;
  Result? result;

  SalesRemainingLimitModel({this.jsonrpc, this.id, this.result});

  SalesRemainingLimitModel.fromJson(Map<String, dynamic> json) {
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
    return SalesRemainingLimitModel(result: result,id: id,jsonrpc: jsonrpc);
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
  double? limit;
  double? amountDue;
  double? remainingLimit;

  Data({this.limit, this.amountDue, this.remainingLimit});

  Data.fromJson(Map<String, dynamic> json) {
    limit = (json['limit'] is int) ? (json['limit'] as int).toDouble() : json['limit'];
    amountDue = (json['amount_due'] is int) ? (json['amount_due'] as int).toDouble() : json['amount_due'];
    remainingLimit = (json['remaining_limit'] is int) ? (json['remaining_limit'] as int).toDouble() : json['remaining_limit'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['amount_due'] = this.amountDue;
    data['remaining_limit'] = this.remainingLimit;
    return data;
  }
}