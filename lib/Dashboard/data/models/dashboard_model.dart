import 'package:water/Base/network/network-mappers.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';

class DashboardModel extends BaseMappable {
  String? jsonrpc;
  String? id;
  Result? result;

  DashboardModel({this.jsonrpc, this.id, this.result});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
    return DashboardModel.fromJson(json);
  }
}

class Result {
  int? statusCode;
  bool? isError;
  String? message;
  var target;
  var sales;
  var returns;
  var amountDue;
  var collection;
  List<Statistics>? statistics;

  Result(
      {this.statusCode,
        this.isError,
        this.message,
        this.target,
        this.sales,
        this.returns,
        this.amountDue,
        this.collection,
        this.statistics});

  Result.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    target = json['target'];
    sales = json['sales'];
    returns = json['returns'];
    amountDue = json['amount_due'];
    collection = json['collection'];
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(new Statistics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['is_error'] = this.isError;
    data['message'] = this.message;
    data['target'] = this.target;
    data['sales'] = this.sales;
    data['returns'] = this.returns;
    data['amount_due'] = this.amountDue;
    data['collection'] = this.collection;
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/*
class Statistics {
  var target;
  var month;
  var sales;
  var returns;
  var amountDue;
  var collection;

  Statistics(
      {this.target,
        this.month,
        this.sales,
        this.returns,
        this.amountDue,
        this.collection});

  Statistics.fromJson(Map<String, dynamic> json) {
    target = json['target'];
    month = json['month'];
    sales = json['sales'];
    returns = json['returns'];
    amountDue = json['amount_due'];
    collection = json['collection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['target'] = this.target;
    data['month'] = this.month;
    data['sales'] = this.sales;
    data['returns'] = this.returns;
    data['amount_due'] = this.amountDue;
    data['collection'] = this.collection;
    return data;
  }
}*/
