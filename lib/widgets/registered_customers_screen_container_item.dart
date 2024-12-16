import 'package:flutter/material.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Visits/presentation/pages/Today/visits_today_screen_details.dart';

class RegisteredCustomersScreenContainerItem extends StatelessWidget {
  const RegisteredCustomersScreenContainerItem(
      {super.key,
      required this.storeName,
      required this.sales,
      required this.distance,
      required this.money});

  final String storeName;
  final String sales;
  final String distance;
  final String money;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return InkWell(
            onTap: (){
              customAnimatedPushNavigation(context, VisitsTodayDetailsScreen());
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
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Image.asset('assets/images/VectorShopp.png'),
                              SizedBox(
                                width: constraints.maxWidth * 0.008,
                              ),
                              Flexible(
                                child: Text(
                                  storeName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                maxLines: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.114,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 245, 245),
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/Vectormnmn.png'),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.008,
                                  ),
                                  Flexible(
                                    child: Text(
                                      distance,
                                      style: const TextStyle(
                                        color: Color(0xff0056C9),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    maxLines: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Image.asset('assets/images/VectorStrokeCash.png'),
                          SizedBox(
                            width: constraints.maxWidth * 0.008,
                          ),
                          Text(
                            money,
                            style: TextStyle(
                              color: Color(0xFFAC6521),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Image.asset('assets/images/VectorStrokeTruee.png'),
                          SizedBox(
                            width: constraints.maxWidth * 0.008,
                          ),
                          Text(
                            sales,
                            style: TextStyle(
                              color: Color(0xff1D6E4F),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
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
