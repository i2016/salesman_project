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


  AddedProductEntity copyWith({
    int? id,
    String? name,
    String? description,
    double? total,
    double? price,
    String? image,
    int? selectedCount,
    UomIds? unit
  }) {
    return AddedProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      selectedCount: selectedCount ?? this.selectedCount,
      total: total ?? this.total,
      unit: unit ?? this.unit,
    );
  }
}