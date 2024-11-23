import 'package:flutter/material.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/index.dart';

class VisitsHistoryScreenContainerItem extends StatelessWidget {
  const VisitsHistoryScreenContainerItem(
      {super.key,
      required this.date,
      required this.store,
      required this.collect,
      required this.returned,
      required this.visit,
      required this.complete,
      required this.icon,
      required this.iconColor,
      required this.iconProductType,
      required this.iconStoreName,
      required this.iconCompleted,
      required this.iconReturned,
      required this.iconCollected,
      required this.collectedColor});

  final String date;
  final String store;
  final String collect;
  final String returned;
  final String visit;
  final String complete;
  final String icon;
  final String iconProductType;
  final String iconStoreName;
  final String iconCompleted;
  final String iconReturned;
  final String iconCollected;
  final Color iconColor;
  final Color collectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.08
                  : MediaQuery.of(context).size.height * 0.128,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              iconProductType,
                              color: Colors.black,
                              height: MediaQuery.of(context).size.height * 0.013,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.008,
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      /*  Container(
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
                                  icon,
                                  color: iconColor,
                                  height:
                                      MediaQuery.of(context).size.height * 0.014,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.008,
                                ),
                                Text(
                                  visit,
                                  style: TextStyle(
                                      color: iconColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),*/
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Image.asset(
                            iconStoreName,
                            height: MediaQuery.of(context).size.height * 0.013,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.008,
                          ),
                      Flexible(
                        child:  Text(
                            store,
                            style: const TextStyle(
                                color: Color(0xFFAC6521),
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis,
                        )  ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                iconCompleted,
                                color: const Color(0xff0056C9),
                                height:
                                    MediaQuery.of(context).size.height * 0.013,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.008,
                              ),
                              Text(
                                complete,
                                style: const TextStyle(
                                    color: Color(0xff0056C9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Container(
                            color: Color(0xffDCDFE3),
                            height: 20,
                            width: 2,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                iconReturned,
                                color: const Color(0xffAC6521),
                                height:
                                    MediaQuery.of(context).size.height * 0.013,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.008,
                              ),
                              Text(
                                returned,
                                style: const TextStyle(
                                    color: Color(0xffAC6521),
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Container(
                            color: Color(0xffDCDFE3),
                            height: 20,
                            width: 2,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                iconCollected,
                                color: collectedColor,
                                height:
                                    MediaQuery.of(context).size.height * 0.013,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.008,
                              ),
                              Text(
                                collect,
                                style: TextStyle(
                                    color: collectedColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
      ],
    );
  }
}
