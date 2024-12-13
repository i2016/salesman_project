import 'package:water/Base/network/network-mappers.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';

class InvoiceHistoryModel extends BaseMappable {
  String? jsonrpc;
  String? id;
  InvoiceResult? invoiceResult;

  InvoiceHistoryModel({this.jsonrpc, this.id, this.invoiceResult});

  InvoiceHistoryModel.fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    invoiceResult =
    json['result'] != null ? new InvoiceResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jsonrpc'] = this.jsonrpc;
    data['id'] = this.id;
    if (this.invoiceResult != null) {
      data['result'] = this.invoiceResult!.toJson();
    }
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    jsonrpc = json['jsonrpc'];
    id = json['id'];
    invoiceResult =
    json['result'] != null ? new InvoiceResult.fromJson(json['result']) : null;
    return InvoiceHistoryModel(id: id,jsonrpc: jsonrpc,invoiceResult: invoiceResult);
  }


}

class InvoiceResult {
  int? statusCode;
  bool? isError;
  String? message;
  List<Invoice>? invoices;
  List<Statistics>? statistics;

  InvoiceResult(
      {this.statusCode,
        this.isError,
        this.message,
        this.invoices,
        this.statistics});

  InvoiceResult.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isError = json['is_error'];
    message = json['message'];
    if (json['result'] != null) {
      invoices = <Invoice>[];
      json['result'].forEach((v) {
        invoices!.add(new Invoice.fromJson(v));
      });
    }
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
    if (this.invoices != null) {
      data['result'] = this.invoices!.map((v) => v.toJson()).toList();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Invoice {
  var type;
  var invoiceId;
  var invoiceNumber;
  var paymentNumber;
  var invoiceDate;
  var amountTotal;
  var amountDue;
  var itemsCount;
  var paymentId;
  var paymentDate;
  var paymentAmount;
  InvoiceData? print;
  Invoice(
      {this.type,
        this.invoiceId,
        this.invoiceNumber,
        this.invoiceDate,
        this.amountTotal,
        this.itemsCount,
        this.paymentNumber,
        this.paymentId,
        this.paymentDate,
        this.paymentAmount,
        this.amountDue,
      this.print});

  Invoice.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    invoiceId = json['invoice_id'];
    invoiceNumber = json['invoice_number'];
    invoiceDate = json['invoice_date'];
    amountTotal = json['amount_total'];
    amountDue = json['amount_due'];
    itemsCount = json['items'];
    paymentNumber = json['payment_number'];
    paymentId = json['payment_id'];
    paymentDate = json['payment_date'];
    paymentAmount = json['payment_amount'];
    print = json['print'] != null ? new InvoiceData.fromJson(json['print']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['invoice_id'] = this.invoiceId;
    data['invoice_number'] = this.invoiceNumber;
    data['invoice_date'] = this.invoiceDate;
    data['amount_total'] = this.amountTotal;
    data['amount_due'] = this.amountDue;
    data['items'] = this.itemsCount;
    data['payment_number'] = this.paymentNumber;
    data['payment_id'] = this.paymentId;
    data['payment_date'] = this.paymentDate;
    data['payment_amount'] = this.paymentAmount;
    if (this.print != null) {
      data['print'] = this.print!.toJson();
    }

    return data;
  }
}

class Statistics {
  var month;
  var sales;
  var  returns;
  var collection;

  Statistics({this.month, this.sales, this.returns, this.collection});

  Statistics.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    sales = json['sales'];
    returns = json['returns'];
    collection = json['collection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['sales'] = this.sales;
    data['returns'] = this.returns;
    data['collection'] = this.collection;
    return data;
  }
}



