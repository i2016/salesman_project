import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            MediaQuery.of(context).size.height * 0.045
            : MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                       Expanded(
                      flex: 1,
                      child: Text(
                        addedProductEntity == null ?  '33'
                        : addedProductEntity!.selectedCount!.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ),
                       Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addedProductEntity == null ?  'مياه'
                                      : addedProductEntity!.name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xff25292E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  addedProductEntity == null ? 'مياه مدينة شرنك 15 حبة  600 مل'
                                      : addedProductEntity!.description!,

                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              ],
                            ),
                        ),


                      ),
                       Expanded(
                      flex: 2,
                      child: Text(
                        addedProductEntity == null ?  '42 ر.س'
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