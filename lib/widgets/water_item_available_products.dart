import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/widgets/image_placholder_widget.dart';
import 'package:water/widgets/order_add_product_widget.dart';

class WaterItemAvailableProducts extends StatelessWidget {
  final Product? product;
   WaterItemAvailableProducts({super.key,this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
              content: OrderAddProductWidget(
                product: product,
              )
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
        child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).orientation == Orientation.portrait ?
              MediaQuery.of(context).size.height * 0.08
              : MediaQuery.of(context).size.height * 0.12,
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
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 247, 245, 245),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/InfoooCircle.png',
                                        width:
                                            MediaQuery.of(context).size.width * 0.016,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width * 0.002,
                                      ),
                                      const Text(
                                       'الكاتيجوري',
                                        style: TextStyle(
                                            color: Color(0xff111111),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child:   CachedNetworkImage(
                              imageUrl: product!.image!,
                              placeholder: (context, url) {
                                return ImagePlacholderWidget();
                              },
                              errorWidget: (context, url, error){
                                return ImagePlacholderWidget();

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                        product != null ?  product!.name! :   'مياه',
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                             overflow: TextOverflow.ellipsis,
                          ),
                           Text(
                             product != null ?  product!.description! :  'مياه مدينة شرنك 15 حبة  600 مل',
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                             overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.017,
                          ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                product != null ?  "${product!.price}  ر.س " :  '42 ر.س',
                                style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                 overflow: TextOverflow.ellipsis,
                                                         ),

                             /*  Text(
                                 "${product!.id}  ",
                                 style:
                                 TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                 overflow: TextOverflow.ellipsis,
                               ),*/
                             ],
                           ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

      ),
    );
  }
}
