import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  const OrderAddProductWidget({super.key,this.product});

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
                      width: MediaQuery.of(context).size.width * 0.012,
                    ),
                    const Text(
                      'اضافة المنتج',
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
                              imageUrl: widget.product!.image!,
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
                              widget.product!.name!,
                            maxLines: 4,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                             Text(
                             widget.product!.description!,
                             maxLines: 4,

                               style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.017,
                            ),
                             Text(
                              '${ selectedUnitPrice!.toStringAsFixed(2) /*widget.product!.price!*/}  ر.س ',
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الوحدات',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                      child: CustomUnitsDropdown(
                        title:    'الوحدة',
                        units: widget.product?.uomIds,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.04
                            : MediaQuery.of(context).size.height * 0.065,
                        onUnitSelected: (unit){
                          print("selectedUnitId : ${unit.id}");
                         setState(() {
                           selectedUnit = unit;
                           if(selectedUnit!.id == widget.product!.mainUomId){
                             selectedUnitPrice = widget.product!.price;
                           }else{
                             selectedUnitPrice = widget.product!.one_price;
                           }
                         });
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'العدد',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/marketImage.png',
                              height: MediaQuery.of(context).size.height * 0.011,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'متاح  ${widget.product!.count!}  قطعة',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(int.parse(controller.text.normalizeNumber()) > 0)
                                    controller.text= ((int.parse(controller.text.normalizeNumber()) ?? 0) - 1).toString();
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
                                    hintText: 'ادخل الكمية',
                                    hintStyle: TextStyle(
                                      color: Color(0xff758195),
                                    ),
                                  ),)



                              /*   Center(
                          child: Text("${selectedProductCount}"),
                        ),*/
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.013,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  final productCount = int.tryParse(widget.product!.count!) != null
                                      ? int.parse(widget.product!.count!)
                                      : double.parse(widget.product!.count!).toInt();
                                  print("productCount : ${productCount}");

                                  if (int.parse(controller.text.normalizeNumber() )< productCount) {
                                    controller.text= ((int.parse(controller.text.normalizeNumber() ) ?? 0) + 1).toString();
                                  }else if(controller.text.normalizeNumber() == 0){
                                    controller.text= ((int.parse(controller.text.normalizeNumber() ) ?? 0) + 1).toString();
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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Banknote2.png'
                                  ),
                                  SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005,
                        ),
                                   Text(
                                    'اجمالي  ${(int.parse(controller.text.normalizeNumber()) * selectedUnitPrice!).toStringAsFixed(2)/*widget.product!.price!*/}   ر.س',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                   Image.asset(
                                    'assets/images/asssa.png',
                                    height: MediaQuery.of(context).size.height * 0.012,
                                    color: const Color(0xff111111),
                                  ),
                                   SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005,
                        ),
                                   Text(
                                     'متبقى ${int.tryParse(widget.product!.count!) != null ?
                                     int.parse(widget.product!.count!) - int.parse(controller.text.normalizeNumber())
                                         : double.parse(widget.product!.count!).toInt() - int.parse( controller.text.normalizeNumber())}  قطعة',
                                     style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    GestureDetector(
                      onTap:  () {
                        if( Shared.order_products_list.where((element) => element.id ==
                            widget.product!.id)
                            .toList(growable: true).length == 0
                            && int.parse(controller.text.normalizeNumber().normalizeNumber()) != 0
                            && selectedUnit != null ){
                          Shared.order_products_list.add(AddedProductEntity(
                            id: widget.product!.id,
                            name: widget.product!.name,
                            image: widget.product!.image,
                            description: widget.product!.description,
                            price: selectedUnitPrice, //widget.product!.price,
                            selectedCount: int.parse(controller.text.normalizeNumber().normalizeNumber()),
                            total: int.parse(controller.text.normalizeNumber()) * selectedUnitPrice! /*widget.product!.price!*/,
                            unit: selectedUnit!
                          ));
                          ToastWidget.showToast(message: "تم اضافة المنتج بنجاح");
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
                            color:  int.parse(    controller.text.normalizeNumber()) != 0 && selectedUnit != null  ? const Color(0xff1D7AFC) : kGreyColor,
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
                            const Text('اضافة للطلب',
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
}
