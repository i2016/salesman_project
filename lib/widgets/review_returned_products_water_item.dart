import 'package:flutter/material.dart';
import 'package:water/Returns/domain/entities/returns_product_entity.dart';

class ReviewReturnedProductsWaterItem extends StatelessWidget{
  ReturnsProductEntity returnsProductEntity;
   ReviewReturnedProductsWaterItem({super.key,required this.returnsProductEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,

              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/IMGggg.png')
                    ),

                     Expanded(
                    flex: 2,
                    child: Text(
                      returnsProductEntity.selectedCount.toString() ?? "1",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                     Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                           children: [


                             Flexible(
                               child: Text(
                                 returnsProductEntity.name ?? '',
                                 style: TextStyle(
                                     color: Color(0xff25292E),
                                     fontSize: 14,
                                     fontWeight: FontWeight.w500
                                 ),
                               maxLines: 4,
                               ),
                               fit: FlexFit.tight,
                             ),
                           ],
                         ),
                        Text(
                          returnsProductEntity.description ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                          ),
                        maxLines: 4,
                        ),
                      ],
                    ),
                    ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      returnsProductEntity.unit?.name ?? '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                     Expanded(
                    flex: 2,
                    child: Text(
                      ' ${returnsProductEntity.price ?? 1}  ر.س',
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