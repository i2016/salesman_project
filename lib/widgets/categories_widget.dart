import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/widgets/image_placholder_widget.dart';

class CategoriesWidget extends StatelessWidget{
  CategoryData? categoryData;
   CategoriesWidget({super.key,this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.013),
      child: MediaQuery.of(context).orientation == Orientation.portrait ?
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.115,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: CachedNetworkImage(
                    imageUrl: categoryData!.image!,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                           categoryData == null ? 'مياة' :categoryData!.name!  ,
                          style: TextStyle(
                            color: Color(0xff25292E),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                           overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 245, 245),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/marketImage.png',
                                      width: MediaQuery.of(context).size.width * 0.024,
                                      ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.002,
                                    ),
                                     Text(
                                       categoryData == null ? '50 منتج' :
                                       '${categoryData!.productCount!} منتج ',
                                      style: TextStyle(
                                        color: Color(0xff0056C9),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      )
      :Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.258,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
              Expanded(
              flex: 5,
              child: CachedNetworkImage(
                  imageUrl: categoryData!.image!,
                  placeholder: (context, url) {
                    return ImagePlacholderWidget();
                  },
                  errorWidget: (context, url, error){
                    return ImagePlacholderWidget();

                  },
                )),

            /*    SizedBox(
                  height: MediaQuery.of(context).size.height * 0.004,
                ),*/
                Expanded(
                    flex: 2,
                    child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                         categoryData == null ? 'مياة' :categoryData!.name!  ,
                        style: TextStyle(
                          color: Color(0xff25292E),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                            decoration: BoxDecoration(
                            color: Color.fromARGB(255, 247, 245, 245),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/marketImage.png',
                                    width: MediaQuery.of(context).size.width * 0.024,
                                    ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.002,
                                  ),
                                   Text(
                                     categoryData == null ? '50 منتج' :
                                     '${categoryData!.productCount!} منتج ',
                                     style: TextStyle(
                                      color: Color(0xff0056C9),
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ],
                  ),
                )),
              ],
            ),
      ),
    );
  }
}