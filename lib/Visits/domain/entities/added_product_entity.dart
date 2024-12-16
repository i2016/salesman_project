import 'package:water/Visits/data/models/product_model.dart';

class AddedProductEntity{
  int? id;
  String? name;
  String? description;
  double? total;
  double? price;
  String? image;
  int? selectedCount;
  UomIds? unit;
  AddedProductEntity({this.id,this.name,this.description,
    this.price,this.image,this.selectedCount,this.total,this.unit});
}