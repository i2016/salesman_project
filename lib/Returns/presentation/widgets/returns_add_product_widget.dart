import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Base/common/toast.dart';
import 'package:water/Base/convert_arabic_numbers_to_english_extension.dart';
import 'package:water/Returns/data/models/invoices_details_model.dart';
import 'package:water/Returns/domain/entities/returns_product_entity.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/widgets/custom_unit_dropdown.dart';
import 'package:water/widgets/image_placholder_widget.dart';

class ReturnsAddProductWidget extends StatefulWidget {
  final Item? item;

  const ReturnsAddProductWidget({super.key,this.item});

  @override
  State<ReturnsAddProductWidget> createState() => _ReturnsAddProductWidgetState();
}

class _ReturnsAddProductWidgetState extends State<ReturnsAddProductWidget> {
  TextEditingController controller = new TextEditingController();
  UomIds? selectedUnit;
  @override
  void initState() {
    controller.text = double.parse( widget.item!.quantity.toString()).toInt().toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.7,

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
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
                      width: MediaQuery.of(context).size.width * 0.012,
                    ),
                     Text(
                      "return_product".tr(),
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.018,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).orientation == Orientation.portrait ?
                  MediaQuery.of(context).size.height * 0.1
                      : MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child:   CachedNetworkImage(
                              imageUrl: widget.item!.image ?? '',
                              placeholder: (context, url) {
                                return ImagePlacholderWidget();
                              },
                              errorWidget: (context, url, error){
                                return ImagePlacholderWidget();

                              },
                            ),),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.012,
                      ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              widget.item!.productName ?? '',
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                             Text(
                             widget.item!.description ?? '',

                               style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                 overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.017,
                            ),
                             Text(
                              '${widget.item!.price ?? 0}  ${"sar".tr()} ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,),
          child:   Row(
                  children: [
                     Text(
                      '${"sold_quantity".tr()} : ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
SizedBox(width: Shared.width * 0.1,),
                     Text(
                      '  ${widget.item!.quantity ?? 0}  قطعة ',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
          ) ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          '${"unit".tr()} : ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: Shared.width * 0.1,),
                        Text(
                          widget.item!.uom_name ?? '',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (int.parse(controller.text.normalizeNumber()) > 0) {
                              controller.text = ((int.parse(controller.text.normalizeNumber()) ?? 0) - 1).toString();
                            }
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
                        width: MediaQuery.of(context).size.width * 0.013,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.13,
                          height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.036
                              : MediaQuery.of(context).size.height * 0.064,
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
                        textAlign: TextAlign.center, // Horizontal alignment
                        textAlignVertical: TextAlignVertical.center, // Vertical alignment
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: "enter_quantity".tr(),
                          hintStyle: TextStyle(
                            color: Color(0xff758195),
                          ),
                        ),)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.013,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            final productCount = int.tryParse(widget.item!.quantity!.toString()) != null
                                ? int.parse(widget.item!.quantity!.toString())
                                : double.parse(widget.item!.quantity!.toString()).toInt();

                            if (int.parse(controller.text.normalizeNumber() )< productCount) {
                              controller.text = ((int.parse(controller.text.normalizeNumber()) ?? 0) + 1).toString();
                            }else if(controller.text.normalizeNumber() == 0){
                              controller.text = ((int.parse(controller.text.normalizeNumber()) ?? 0) + 1).toString();

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,),
          child:   Row(
          children: [
            Image.asset(
                'assets/images/Banknote2.png'
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.005,
            ),
            Text(
              '${"total".tr()}  ${ double.parse((double.parse(controller.text.normalizeNumber()).toInt()
                  * widget.item!.price!).toString()).toStringAsFixed(2)}    ${"sar".tr()} ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
          ) ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      child: GestureDetector(
                        onTap: () {
                          if( Shared.returns_products_list.where((element) => element.id ==
                              widget.item!.productId).toList(growable: true).length == 0
                              && int.parse(controller.text.normalizeNumber().normalizeNumber()) != 0
                              ){
                            Shared.returns_products_list.add(ReturnsProductEntity(
                              id: widget.item!.productId,
                              name: widget.item!.productName,
                              image: widget.item!.image,
                              description: widget.item!.description,
                              price: widget.item!.price,
                              selectedCount: int.parse(controller.text.normalizeNumber().normalizeNumber()),
                              total: int.parse(controller.text.normalizeNumber().normalizeNumber()) * widget.item!.price!,
                              categoryId: widget.item!.categoryId,
                              category: widget.item!.category,
                              unit: UomIds(
                                id: widget.item?.uom_id,
                                name: widget.item?.uom_name
                              )
                            ));
                            ToastWidget.showToast(message: "product_added_successfully".tr());
                            Navigator.pop(context);
                            setState(() {

                            });
                          }


                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.039
                              : MediaQuery.of(context).size.height * 0.066,
                          decoration: BoxDecoration(
                              color:  double.parse(controller.text.normalizeNumber()).toInt()  != 0
                                  ? const Color(0xff1D7AFC) : kGreyColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/CheckCircle.png',
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.006,
                              ),
                               Text("add_to_return_invoice".tr(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
          ),
      ),
    );
  }
}
