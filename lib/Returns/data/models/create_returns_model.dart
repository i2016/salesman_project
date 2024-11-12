import 'package:water/Base/network/network-mappers.dart';

class CreateReturnsModel extends BaseMappable{
  String? jsonrpc;
  String? id;
  Result? result;

  CreateReturnsModel({this.jsonrpc, this.id, this.result});

  CreateReturnsModel.fromJson(Map<String, dynamic> json) {
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
    return CreateReturnsModel(id: id,result: result,jsonrpc: jsonrpc);
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
  int? stockReturnId;
  String? stockReturn;
  int? invoiceReturnId;
  String? returnsInvoicePdf;
  Data({this.stockReturnId, this.stockReturn, this.invoiceReturnId,this.returnsInvoicePdf});

  Data.fromJson(Map<String, dynamic> json) {
    stockReturnId = json['stock_return_id'];
    stockReturn = json['stock_return'];
    invoiceReturnId = json['invoice_return_id'];
    returnsInvoicePdf = json['return_pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock_return_id'] = this.stockReturnId;
    data['stock_return'] = this.stockReturn;
    data['invoice_return_id'] = this.invoiceReturnId;
    data['return_pdf'] = this.returnsInvoicePdf;
    return data;
  }
}