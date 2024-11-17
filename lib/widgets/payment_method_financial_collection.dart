import 'package:flutter/material.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Visits/domain/entities/order_payment_entity.dart';
import 'package:water/widgets/popup_menu_of_payment.dart';

class PaymentMethodFinancialCollection extends StatefulWidget {
  const PaymentMethodFinancialCollection({super.key});

  @override
  State<PaymentMethodFinancialCollection> createState() => _PaymentMethodFinancialCollectionState();
}

class _PaymentMethodFinancialCollectionState extends State<PaymentMethodFinancialCollection> {
  List<String> selectedPaymentMethods = [];
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedPaymentMethods.add('شيك أو تحويل');

}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'الكمية المحصلة',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.327,
                    height: MediaQuery.of(context).orientation == Orientation.portrait ?
             MediaQuery.of(context).size.height * 0.038
             : MediaQuery.of(context).size.height * 0.063,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 189, 184, 184),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextField(
                        controller: _amountController,
                        cursorColor: Color.fromARGB(255, 66, 64, 64),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/images/VectorStroke.png',
                            width: 22,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: 'المبلغ بالريال',
                          hintStyle: const TextStyle(
                            color: Color(0xff758195),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'طريقة الدفع',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.327,
                    height: MediaQuery.of(context).orientation == Orientation.portrait ?
             MediaQuery.of(context).size.height * 0.038
             : MediaQuery.of(context).size.height * 0.063,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 189, 184, 184),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/Card.png',
                              width: 22,
                              color: Colors.black,
                            ),
                          ),
                           Expanded(
                            flex: 4,
                            child: Text(
                              selectedPaymentMethods[0],
                              style: TextStyle(
                                color: Color(0xff758195),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                           Expanded(
                            flex: 1,
                            child: PopupMenuOfPayment(
                              onSelected: (String newMethod) {
                                setState(() {
                                  selectedPaymentMethods[0] = newMethod; // Update the selected method

                                      Shared.collectionPayment.add(OrderPaymentEntity(
                                        amount: _amountController.text, // Get amount from corresponding controller
                                        method: newMethod,
                                      ));


                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
