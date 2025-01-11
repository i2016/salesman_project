import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Base/common/toast.dart';
import 'package:water/Base/convert_arabic_numbers_to_english_extension.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/widgets/custom_dropdown.dart';
import 'package:water/widgets/custom_unit_dropdown.dart';
import 'package:water/widgets/image_placholder_widget.dart';

class OrderAddProductWidget extends StatefulWidget {
  final Product? product;

  const OrderAddProductWidget({super.key, this.product});

  @override
  State<OrderAddProductWidget> createState() => _OrderAddProductWidgetState();
}

class _OrderAddProductWidgetState extends State<OrderAddProductWidget> {
  TextEditingController controller = new TextEditingController();
  UomIds? selectedUnit;
  double? selectedUnitPrice;

  @override
  void initState() {
    controller.text = "1";
    selectedUnitPrice = widget.product!.price;
    selectedUnit = UomIds(
        name: widget.product!.mainUomName, id: widget.product!.mainUomId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.6,
      height: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      child: Directionality(
         textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const ImageIcon(
                      AssetImage('assets/images/cancell.png'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.012,
                  ),
                   Text(
                     "add_product".tr(),
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.018,
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.6,
                height:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * 0.12
                    : MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CachedNetworkImage(
                          imageUrl: widget.product!.image!,
                          placeholder: (context, url) {
                            return ImagePlacholderWidget();
                          },
                          errorWidget: (context, url, error) {
                            return ImagePlacholderWidget();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.012,
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Flexible(
                          child:Text(
                              widget.product!.name!,
                             maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                          )   ),
                              Text(
                             widget.product!.description!,

                                maxLines: 4,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.017,
                              ),
                              Text(
                                '${selectedUnitPrice!.toStringAsFixed(
                                    2) /*widget.product!.price!*/} ${"sar".tr()} ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.012,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "units".tr(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    child: CustomUnitsDropdown(
                      title: "unit".tr(),
                      units: widget.product?.uomIds,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      height: MediaQuery
                          .of(context)
                          .orientation ==
                          Orientation.portrait
                          ? MediaQuery
                          .of(context)
                          .size
                          .height * 0.04
                          : MediaQuery
                          .of(context)
                          .size
                          .height * 0.065,
                      onUnitSelected: (unit) {
                        setState(() {
                          selectedUnit = unit;
                          if (selectedUnit!.id == widget.product!.mainUomId) {
                            selectedUnitPrice = widget.product!.price;
                          } else {
                            selectedUnitPrice = widget.product!.one_price;
                          }
                          controller.text = "1";
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Text(
                         "number".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          'assets/images/marketImage.png',
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.011,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${"available".tr()}  ${(selectedUnit!.id == widget.product!.mainUomId)
                            ? widget.product!.count!
                            : widget.product!.unit_count}   ${"piece".tr()}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (int.parse(controller.text.normalizeNumber()) >
                                  0)
                                controller.text = ((int.parse(controller.text
                                    .normalizeNumber()) ??
                                    0) -
                                    1)
                                    .toString();
                            });
                          },
                          child: const ImageIcon(
                            color: Colors.red,
                            AssetImage(
                              'assets/images/minusCircle.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.013,
                        ),
                        Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.13,
                            height: MediaQuery
                                .of(context)
                                .orientation ==
                                Orientation.portrait
                                ? MediaQuery
                                .of(context)
                                .size
                                .height * 0.036
                                : MediaQuery
                                .of(context)
                                .size
                                .height * 0.064,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                              controller: controller,
                              cursorColor: Color.fromARGB(255, 66, 64, 64),
                              textAlign:
                              TextAlign.center,
                              // Horizontal alignment
                              textAlignVertical: TextAlignVertical
                                  .center,
                              // Vertical alignment
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                hintText: "enter_quantity".tr(),
                                hintStyle: TextStyle(
                                  color: Color(0xff758195),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  final productCount =
                                  int.tryParse(widget.product!.count!) != null
                                      ? int.parse((selectedUnit!.id ==
                                      widget.product!.mainUomId)
                                      ? widget.product!.count! : widget.product!
                                      .unit_count!)
                                      : double.parse((selectedUnit!.id ==
                                      widget.product!.mainUomId)
                                      ? widget.product!.count! : widget.product!
                                      .unit_count!).toInt();
                                  if (int.parse(value.normalizeNumber()) <
                                      productCount) {
                                    controller.text =
                                        ((int.parse(value.normalizeNumber()) ??
                                            0)).toString();
                                  } else if (value.normalizeNumber() == 0) {
                                    controller.text =
                                        ((int.parse(value.normalizeNumber()) ??
                                            0)).toString();
                                  }
                                });
                              },
                            )

                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.013,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              final productCount =
                              int.tryParse(widget.product!.count!) != null ? int
                                  .parse((selectedUnit!.id ==
                                  widget.product!.mainUomId)
                                  ? widget.product!.count!
                                  : widget.product!.unit_count!)
                                  : double.parse((selectedUnit!.id ==
                                  widget.product!.mainUomId)
                                  ? widget.product!.count!
                                  : widget.product!.unit_count!).toInt();

                              if (int.parse(controller.text.normalizeNumber()) <
                                  productCount) {
                                controller.text = ((int.parse(
                                    controller.text.normalizeNumber()) ?? 0) +
                                    1).toString();
                              } else
                              if (controller.text.normalizeNumber() == 0) {
                                controller.text = ((int.parse(
                                    controller.text.normalizeNumber()) ?? 0) +
                                    1).toString();
                              }
                            });
                          },
                          child: const ImageIcon(
                              color: Colors.blue,
                              AssetImage('assets/images/AddCircle.png')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/Banknote2.png'),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.005,
                          ),
                          Text(
                            ' ${"total_amount".tr()}  ${(int.parse(
                                controller.text.normalizeNumber()) *
                                selectedUnitPrice!).toStringAsFixed(
                                2) }    ${"sar".tr()}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/asssa.png',
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.012,
                            color: const Color(0xff111111),
                          ),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.005,
                          ),
                          Text(
                            '${"remaining_amount".tr()} ${getAvailableQuantity()}   ${"piece".tr()}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      final existingProductIndex = Shared.order_products_list
                          .indexWhere((element) =>
                      element.id == widget.product!.id && element.unit!.id ==
                          selectedUnit!.id);

                      if (existingProductIndex != -1) {
                        final existingProduct = Shared
                            .order_products_list[existingProductIndex];
                        final newTotalQuantity = existingProduct
                            .selectedCount! + int.parse(controller.text
                            .normalizeNumber());

                        final availableQuantity = (selectedUnit!.id ==
                            widget.product!.mainUomId)
                            ? widget.product!.count!
                            : widget.product!.unit_count!;
                        final availableQuantityInt = int.tryParse(
                            availableQuantity) ?? double.parse(
                            availableQuantity).toInt();

                        if (newTotalQuantity <= availableQuantityInt) {
                          Shared.order_products_list[existingProductIndex] =
                              existingProduct.copyWith(
                                selectedCount: newTotalQuantity,
                                total: newTotalQuantity * selectedUnitPrice!,
                              );
                          ToastWidget.showToast(
                              message: "تم تحديث المنتج بنجاح");
                        } else {
                          ToastWidget.showToast(
                              message: "الكمية المطلوبة تتجاوز الكمية المتاحة");
                        }
                      } else {
                        final availableQuantity = (selectedUnit!.id ==
                            widget.product!.mainUomId)
                            ? widget.product!.count!
                            : widget.product!.unit_count!;
                        final availableQuantityInt = int.tryParse(
                            availableQuantity) ?? double.parse(
                            availableQuantity).toInt();

                        if (int.parse(controller.text.normalizeNumber()) <=
                            availableQuantityInt) {
                          Shared.order_products_list.add(AddedProductEntity(
                            id: widget.product!.id,
                            name: widget.product!.name,
                            image: widget.product!.image,
                            description: widget.product!.description,
                            price: selectedUnitPrice,
                            selectedCount: int.parse(
                                controller.text.normalizeNumber()),
                            total: int.parse(
                                controller.text.normalizeNumber()) *
                                selectedUnitPrice!,
                            unit: selectedUnit!,
                          ));
                          ToastWidget.showToast(
                              message: "product_added_Success".tr());
                        } else {
                          ToastWidget.showToast(
                              message: "Required_quantity_exceeds_available_quantity".tr());
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.24,
                      height: MediaQuery
                          .of(context)
                          .orientation == Orientation.portrait
                          ? MediaQuery
                          .of(context)
                          .size
                          .height * 0.039
                          : MediaQuery
                          .of(context)
                          .size
                          .height * 0.066,
                      decoration: BoxDecoration(
                          color: int.parse(controller.text.normalizeNumber()) !=
                              0 && selectedUnit != null
                              ? const Color(0xff1D7AFC)
                              : kGreyColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/CheckCircle.png',
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.006,
                          ),
                           Text("add_to_order".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  String getAvailableQuantity() {
    final availableQuantity = (selectedUnit!.id == widget.product!.mainUomId)
        ? widget.product!.count!
        : widget.product!.unit_count!;
    final availableQuantityInt = int.tryParse(availableQuantity) ??
        double.parse(availableQuantity).toInt();
    return availableQuantityInt.toString();
  }

}