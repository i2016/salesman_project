import 'package:water/Base/network/network-mappers.dart';

class AddClientResponseModel extends BaseMappable{
  String? jsonrpc;
  String? id;
  Result? result;

  AddClientResponseModel({this.jsonrpc, this.id, this.result});

  AddClientResponseModel.fromJson(Map<String, dynamic> json) {
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
    return AddClientResponseModel(id: id, jsonrpc: jsonrpc, result: result);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  int? result;

  Result({this.statusCode, this.isError, this.message, this.result});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    data['result'] = this.result;
    return data;
  }
}