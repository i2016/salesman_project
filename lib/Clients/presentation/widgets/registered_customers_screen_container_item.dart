import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Clients/presentation/pages/client_details_screen.dart';
import 'package:water/Visits/data/models/visits_model.dart';
import 'package:water/Visits/presentation/pages/Today/visits_today_screen_details.dart';

class RegisteredCustomersScreenContainerItem extends StatelessWidget {
  const RegisteredCustomersScreenContainerItem(
      {super.key,
         this.visit,
      required this.storeName,
      required this.sales,
      required this.distance,
      required this.money,
       this.type = "visit"});

  final String storeName;
  final String sales;
  final String distance;
  final String money;
  final String type;
final Visit? visit ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return InkWell(
            onTap: (){
              sharedPreferenceManager.writeData(CachingKey.VISIT_ID,  visit?.visitId.toString());
              customAnimatedPushNavigation(context,
                  type == "visit" ?  VisitsTodayDetailsScreen(
                  )
              : const ClientDetailsScreen() );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: [
                              Image.asset('assets/images/VectorShopp.png',scale: 0.6,),
                              SizedBox(
                                width: constraints.maxWidth * 0.02,
                              ),
                              Flexible(
                                child: Text(
                                  type == "visit" ?   visit!.visitName!
                                  : storeName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 4,

                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Image.asset('assets/images/VectorStrokeCash.png',scale: 0.6,),
                          SizedBox(
                            width: constraints.maxWidth * 0.02,
                          ),
                          Text(
                            "${type == "visit" ?  double.parse(visit!.totalAmountDue!.toString()).toStringAsFixed(2)
                                : double.parse(money.replaceFirst(',', '.')).toStringAsFixed(2) }      مديونية       ",
                            style: const TextStyle(
                              color: Color(0xFFAC6521),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Image.asset('assets/images/VectorStrokeTruee.png',scale: 0.6,),
                          SizedBox(
                            width: constraints.maxWidth * 0.02,
                          ),
                          Text(
                           "${ type == "visit" ?  visit!.monthOrders!.toString()
                               : double.parse(sales.replaceFirst(',', '.')).toStringAsFixed(2) }  ${"Monthly_sales".tr()}      ",
                            style: const TextStyle(
                              color: Color(0xff1D6E4F),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
