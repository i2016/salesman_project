/*
import 'package:water/Base/network/network-mappers.dart';

class RecieptModel extends BaseMappable {
  Company? company;
  Invoice? invoice;

  RecieptModel({this.company, this.invoice});

  RecieptModel.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    invoice =
    json['invoice'] != null ? new Invoice.fromJson(json['invoice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.invoice != null) {
      data['invoice'] = this.invoice!.toJson();
    }
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    invoice =
    json['invoice'] != null ? new Invoice.fromJson(json['invoice']) : null;
    return RecieptModel(company: company,invoice: invoice);
  }
}

class Company {
  String? name;
  String? vat;

  Company({this.name, this.vat});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    vat = json['vat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['vat'] = this.vat;
    return data;
  }
}

class Invoice {
  String? number;
  String? date;
  String? salesman;
  Customer? customer;
  List<Items>? items;
  Totals? totals;

  Invoice(
      {this.number,
        this.date,
        this.salesman,
        this.customer,
        this.items,
        this.totals});

  Invoice.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    date = json['date'];
    salesman = json['salesman'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totals =
    json['totals'] != null ? new Totals.fromJson(json['totals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['date'] = this.date;
    data['salesman'] = this.salesman;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.totals != null) {
      data['totals'] = this.totals!.toJson();
    }
    return data;
  }
}

class Customer {
  String? name;
  String? vat;
  String? cr;

  Customer({this.name, this.vat, this.cr});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    vat = json['vat'];
    cr = json['cr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['vat'] = this.vat;
    data['cr'] = this.cr;
    return data;
  }
}

class Items {
  String? code;
  String? description;
  int? quantity;
  double? price;
  double? discount;
  double? vat;
  double? total;

  Items(
      {this.code,
        this.description,
        this.quantity,
        this.price,
        this.discount,
        this.vat,
        this.total});

  Items.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['vat'] = this.vat;
    data['total'] = this.total;
    return data;
  }
}

class Totals {
  int? quantity;
  double? price;
  double? discount;
  double? vat;
  double? grandTotal;

  Totals({this.quantity, this.price, this.discount, this.vat, this.grandTotal});

  Totals.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    vat = json['vat'];
    grandTotal = json['grandTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['vat'] = this.vat;
    data['grandTotal'] = this.grandTotal;
    return data;
  }
}*/
