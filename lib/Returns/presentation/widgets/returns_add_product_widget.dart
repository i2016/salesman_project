import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Base/common/toast.dart';
import 'package:water/Returns/data/models/invoices_details_model.dart';
import 'package:water/Returns/domain/entities/returns_product_entity.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/widgets/image_placholder_widget.dart';

class ReturnsAddProductWidget extends StatefulWidget {
  final Item? item;

  const ReturnsAddProductWidget({super.key,this.item});

  @override
  State<ReturnsAddProductWidget> createState() => _ReturnsAddProductWidgetState();
}

class _ReturnsAddProductWidgetState extends State<ReturnsAddProductWidget> {
  int? selectedProductCount ;
  @override
  void initState() {
    selectedProductCount = 1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.6,

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
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
                      'ارتجاع المنتج',
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
                  MediaQuery.of(context).size.height * 0.08
                      : MediaQuery.of(context).size.height * 0.13,
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
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                             Text(
                             widget.item!.description ?? '',
                               overflow: TextOverflow.ellipsis,

                               style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.017,
                            ),
                             Text(
                              '${widget.item!.price ?? 0}  ر.س ',
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
                  children: [
                    const Text(
                      'الكمية المباعة',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                     Text(
                      '  ${widget.item!.quantity ?? 0}  قطعة ',
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
                            if(selectedProductCount != 0)
                            selectedProductCount = (selectedProductCount ?? 0) - 1;
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
                        child:  Center(
                          child: Text("${selectedProductCount}"),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.013,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            final productCount = int.tryParse(widget.item!.quantity!.toString()) != null
                                ? int.parse(widget.item!.quantity!.toString())
                                : double.parse(widget.item!.quantity!.toString()).toInt();

                            if (selectedProductCount! < productCount) {
                              selectedProductCount = (selectedProductCount ?? 0) + 1;
                            }else if(selectedProductCount == 0){
                              selectedProductCount = (selectedProductCount ?? 0) + 1;

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
                Row(
          children: [
            Image.asset(
                'assets/images/Banknote2.png'
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.005,
            ),
            Text(
              'اجمالي  ${ double.parse((selectedProductCount! * widget.item!.price!).toString()).toStringAsFixed(2)}   ر.س',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                    GestureDetector(
                      onTap: () {
                        if( Shared.returns_products_list.where((element) => element.id ==
                            widget.item!.productId).toList(growable: true).length == 0 && selectedProductCount != 0){
                          Shared.returns_products_list.add(ReturnsProductEntity(
                            id: widget.item!.productId,
                            name: widget.item!.productName,
                            image: widget.item!.image,
                            description: widget.item!.description,
                            price: widget.item!.price,
                            selectedCount: selectedProductCount,
                            total: selectedProductCount! * widget.item!.price!,
                          ));
                          ToastWidget.showToast(message: "تم اضافة المنتج لفاتورة الأرتجاع بنجاح");
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
                            color:  selectedProductCount != 0 ? const Color(0xff1D7AFC) : kGreyColor,
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
                            const Text('اضافة لفاتورة الأرتجاع',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                          ],
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
