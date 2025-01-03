import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/widgets/image_placholder_widget.dart';

class ReviewProductWaterItem extends StatelessWidget{
  AddedProductEntity? addedProductEntity;
   ReviewProductWaterItem({super.key,this.addedProductEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          width: double.infinity,
                height: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.height * 0.065
            : MediaQuery.of(context).size.height * 0.085,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: addedProductEntity == null ?
                      Image.asset('assets/images/IMGggg.png')
                          :  CachedNetworkImage(
                        imageUrl: addedProductEntity!.image!,
                        placeholder: (context, url) {
                          return ImagePlacholderWidget();
                        },
                        errorWidget: (context, url, error){
                          return ImagePlacholderWidget();

                        },
                      ),
                      ),
                       Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          addedProductEntity == null ?  '33'
                          : addedProductEntity!.selectedCount!.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                      ),
                      ),
                       Expanded(
                        flex: 9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addedProductEntity == null ?  "water".tr()
                                      : addedProductEntity!.name!,
                                 maxLines: 4,
                                  style: TextStyle(
                                      color: Color(0xff25292E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  addedProductEntity == null ? 'water'.tr()
                                      : addedProductEntity!.description!,

                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                ),
                            /*    Text(
                                  addedProductEntity == null ?
                                      "كرتونة"
                                      : addedProductEntity!.unit!.name!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),*/
                              ],
                            ),
                        ),


                      ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        addedProductEntity == null ?  '--'
                            : " ${addedProductEntity!.unit!.name}  ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                       Expanded(
                      flex: 2,
                      child: Text(
                        addedProductEntity == null ?  '42 ${"sar".tr()}'
                            : " ${addedProductEntity!.price!.toStringAsFixed(2)} ر.س ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ),
                  ],
                ),
        ),
      );
}
}