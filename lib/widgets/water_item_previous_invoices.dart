import 'package:flutter/material.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Visits/presentation/pages/Today/invoices_details_screen.dart';

class WaterItemPreviousInvoices extends StatelessWidget {
  const WaterItemPreviousInvoices(
      {super.key,
      required this.saleName,
      required this.pill,
      required this.date,
      required this.icon,
      required this.textIcon,
      required this.color,
        required this.invoiceId});

  final int invoiceId;
  final String saleName;
  final String pill;
  final String date;
  final String icon;
  final String textIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: InkWell(
            onTap: () {
              sharedPreferenceManager.writeData(CachingKey.INVOICE_ID, invoiceId);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InvoicesDetailsScreen(),
                ),
              );
            },
            child: Container(
                width: double.infinity,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.075
                        : MediaQuery.of(context).size.height * 0.125,
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
                                fontSize: 18, fontWeight: FontWeight.w500),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.024,
                                    color: color,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.002,
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
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Image.asset('assets/images/VectorSvsds.png'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.008,
                            ),
                            Text(
                              pill,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Image.asset('assets/images/VectorPkoik.png'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.008,
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
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
