
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Visits/domain/entities/order_payment_entity.dart';
import 'package:water/widgets/popup_menu_of_payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}


class _PaymentMethodState extends State<PaymentMethod> {
  // List to hold selected payment methods for each row
  List<String> selectedPaymentMethods = [];

  // List to hold the payment amount controllers for each row
  List<TextEditingController> paymentAmountControllers = [];

  @override
  void initState() {
    super.initState();
    // Add the initial row with default payment method and corresponding controller
    selectedPaymentMethods.add("cach_visa".tr()); // Default payment method
    paymentAmountControllers.add(TextEditingController());
  }

  @override
  void dispose() {
    // Dispose of all TextEditingControllers to avoid memory leaks
    for (var controller in paymentAmountControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Method to build a payment row
  Widget _buildPaymentRow({required int rowIndex, required bool isLastRow}) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      "amount_collected".tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.038
                        : MediaQuery.of(context).size.height * 0.061,
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
                        controller: paymentAmountControllers[rowIndex], // Use corresponding controller
                        cursorColor: const Color.fromARGB(255, 66, 64, 64),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/images/VectorStroke.png',
                            width: 22,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: "amount_in_rial".tr(),
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
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      "payment_method".tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.038
                        : MediaQuery.of(context).size.height * 0.061,
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
                          Image.asset(
                            'assets/images/Card.png',
                            width: 22,
                            color: Colors.black,
                          ),
                          // Display selected payment method
                          Text(
                            selectedPaymentMethods[rowIndex],
                            style: const TextStyle(
                              color: Color(0xff758195),
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          PopupMenuOfPayment(
                            onSelected: (String newMethod) {
                              setState(() {
                                // Update the selected payment method for the current row
                                selectedPaymentMethods[rowIndex] = newMethod;
                                Shared.orderPaymentList.add(OrderPaymentEntity(
                                  amount: paymentAmountControllers[rowIndex].text, // Get amount from corresponding controller
                                  method: newMethod,
                                ));
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(''),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: isLastRow
                        ? InkWell(
                      onTap: () {
                        setState(() {
                          // Add new row with default payment method and new controller
                          selectedPaymentMethods.add("cach_visa".tr()); // Default payment method for new row
                          paymentAmountControllers.add(TextEditingController()); // Add new controller
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: MediaQuery.of(context).orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.061,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 246, 246, 246),
                            border: Border.all(
                              color: const Color.fromARGB(255, 189, 184, 184),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child:  Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: ImageIcon(
                                  AssetImage('assets/images/AdddddCircle.png'),
                                ),
                              ),
                              Text(
                              "add_payment".tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        : InkWell(
                      onTap: () {
                        setState(() {
                          // Remove the selected row and its corresponding controller
                          selectedPaymentMethods.removeAt(rowIndex);
                          paymentAmountControllers[rowIndex].dispose(); // Dispose of the controller
                          paymentAmountControllers.removeAt(rowIndex); // Remove the controller from the list
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: MediaQuery.of(context).orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.061,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 246, 246, 246),
                            border: Border.all(
                              color: const Color.fromARGB(255, 189, 184, 184),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child:  Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/deleteee.png'),
                                color: kRedColor,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  "remove_payment".tr(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: kRedColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Generate rows dynamically based on the selectedPaymentMethods list
        for (int i = 0; i < selectedPaymentMethods.length; i++)
          _buildPaymentRow(rowIndex: i, isLastRow: i == selectedPaymentMethods.length - 1),
      ],
    );
  }
}
