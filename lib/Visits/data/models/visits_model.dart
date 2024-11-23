import 'package:water/Base/network/network-mappers.dart';

class VisitsModel extends BaseMappable{
  String? jsonrpc;
  String? id;
  Result? result;

  VisitsModel({this.jsonrpc, this.id, this.result});

  VisitsModel.fromJson(Map<String, dynamic> json) {
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
    return VisitsModel(id: id,jsonrpc: jsonrpc,result: result);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  List<Visit>? result;

  Result({this.statusCode, this.isError, this.message, this.result});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Visit>[];
      json['result'].forEach((v) {
        result!.add(new Visit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Visit {
  var visitId;
  var visitName;
  var customerName;
  var visitStage;
  var totalAmountDue;
  var monthOrders;

  Visit(
      {this.visitId,
        this.visitName,
        this.customerName,
        this.visitStage,
        this.totalAmountDue,
        this.monthOrders});

  Visit.fromJson(Map<String, dynamic> json) {
    visitId = json['visit_id'];
    visitName = json['visit_name'];
    customerName = json['customer_name'];
    visitStage = json['visit_stage'];
    totalAmountDue = json['total_amount_due'];
    monthOrders = json['month_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visit_id'] = this.visitId;
    data['visit_name'] = this.visitName;
    data['customer_name'] = this.customerName;
    data['visit_stage'] = this.visitStage;
    data['total_amount_due'] = this.totalAmountDue;
    data['month_orders'] = this.monthOrders;
    return data;
  }
}