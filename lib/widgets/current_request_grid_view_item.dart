import 'package:flutter/material.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Inventory/presentation/pages/current_requests/inventory_current_request_details_screen.dart';

class CurrentRequestGridViewItem extends StatelessWidget {
  const CurrentRequestGridViewItem(
      {super.key,
      required this.saleName,
      required this.pill,
      required this.date,
      required this.icon,
      required this.textIcon,
      required this.color, required this.productNumber,
      required this.transferId});

  final int transferId;
  final String saleName;
  final String pill;
  final String date;
  final String icon;
  final String textIcon;
  final String productNumber;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: InkWell(
            onTap: () {
              sharedPreferenceManager.writeData(CachingKey.TRANSFER_REQUESTS_ID, transferId);
              customAnimatedPushNavigation(context, const InventoryCurrentRequestDetailsScreen());
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            saleName,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 245, 245),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [
                                  Image.asset(
                                    icon,
                                    height: MediaQuery.of(context).size.height *
                                        0.026,
                                    color: color,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.004,
                                  ),
                                  Text(
                                    textIcon,
                                    style: TextStyle(
                                        color: color,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Image.asset('assets/images/VectorSvsds.png'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.016,
                            ),
                            Text(
                              pill,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Image.asset('assets/images/VectorPkoik.png'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.016,
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/marketImage.png',
                            //  height: MediaQuery.of(context).size.height * 0.024,
                            color: Colors.black,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.016,
                            ),
                            Text(
                              productNumber,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
