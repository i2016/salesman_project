import 'package:water/Base/network/network-mappers.dart';

class VisitsHistoryModel extends BaseMappable {
  String? jsonrpc;
  String? id;
  Result? result;

  VisitsHistoryModel({this.jsonrpc, this.id, this.result});

  VisitsHistoryModel.fromJson(Map<String, dynamic> json) {
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
    return VisitsHistoryModel(jsonrpc: jsonrpc,id: id,result: result);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  List<VisitHistory>? visitHistory;

  Result({this.statusCode, this.isError, this.message, this.visitHistory});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    if (json['result'] != null) {
      visitHistory = <VisitHistory>[];
      json['result'].forEach((v) {
        visitHistory!.add(new VisitHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    if (this.visitHistory != null) {
      data['result'] = this.visitHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisitHistory {
  int? visitId;
  String? visitDate;
  String? visitName;
  String? customerName;
  String? visitStage;
  double? totalAmountDue;
  int? monthOrders;

  VisitHistory(
      {this.visitId,
        this.visitDate,
        this.visitName,
        this.customerName,
        this.visitStage,
        this.totalAmountDue,
        this.monthOrders});

  VisitHistory.fromJson(Map<String, dynamic> json) {
    visitId = json['visit_id'];
    visitDate = json['visit_date'];
    visitName = json['visit_name'];
    customerName = json['customer_name'];
    visitStage = json['visit_stage'];
    totalAmountDue = json['total_amount_due'];
    monthOrders = json['month_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visit_id'] = this.visitId;
    data['visit_date'] = this.visitDate;
    data['visit_name'] = this.visitName;
    data['customer_name'] = this.customerName;
    data['visit_stage'] = this.visitStage;
    data['total_amount_due'] = this.totalAmountDue;
    data['month_orders'] = this.monthOrders;
    return data;
  }
}