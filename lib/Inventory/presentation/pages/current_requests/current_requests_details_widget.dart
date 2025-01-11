import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/bloc/app_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Inventory/data/models/transfer_requests_details_model.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/search_text_field.dart';
import 'package:water/xPrinter/presentation/pages/xPrinter_screen.dart';

class CurrentRequestsDetailsWidget extends StatefulWidget{
  TransferRequestsDetails? transferRequestsDetails;
  CurrentRequestsDetailsWidget({this.transferRequestsDetails});
  @override
  State<StatefulWidget> createState() {
    return CurrentRequestsDetailsWidgetState();
  }
  
}

class CurrentRequestsDetailsWidgetState extends State<CurrentRequestsDetailsWidget>{

  TextEditingController controller = new TextEditingController();
  List<Items> filteredProducts =[]; // Assuming `Product` is the class used for products
  @override
  void initState() {
    super.initState();
    filteredProducts = widget.transferRequestsDetails!.items!;
    controller.addListener(() {
      setState(() {
        filteredProducts = widget.transferRequestsDetails!.items!
            .where((product) => product.productName!.toLowerCase().contains(controller.text))
            .toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).orientation == Orientation.portrait ?
              MediaQuery.of(context).size.height * 0.033
                  : MediaQuery.of(context).size.height * 0.052,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8)
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.5),
                child: TextField(
                  controller: controller,
                  cursorColor: Color.fromARGB(255, 66, 64, 64),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      prefixIcon: Image.asset(
                        'assets/images/search.png',
                        color: Colors.black,
                      ),
      
                      hintText: "search_for_product".tr(),
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 165, 171, 182),
                      )
                  ),
                ),
              )
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          const ImageNumberProductPriceContainer(),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    enabled: widget.transferRequestsDetails!.transferStatus == "Pending" ?  true : false,
                    key: ValueKey(1/*filteredProducts[index]*/),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed:(context) {
                            setState(() {
                              filteredProducts.removeAt(index);
                            });
                          } ,
                          label: "delete".tr(),
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),
                    child: ReviewProductWaterItem(
                      addedProductEntity: AddedProductEntity(
                          id:  filteredProducts[index].productId,
                          name: filteredProducts[index].productName,
                          selectedCount: int.parse(filteredProducts[index].quantity.toString().split('.')[0]),
                          price: filteredProducts[index].productPrice,
                          description: filteredProducts[index].productDescription,
                          image: "",
                          total:double.parse(filteredProducts[index].productPrice.toString())
                              * int.parse(filteredProducts[index].quantity.toString().split('.')[0]),

                          unit: UomIds(
                              id: filteredProducts[index].uom_id,
                              name: filteredProducts[index].uom_name
                          )
                      ),
                    ),
                  );
            
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.018,
          ),
          Container(
            width: double.infinity,
    /*        height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.03
                : MediaQuery.of(context).size.height * 0.05,*/
     /*       decoration: const BoxDecoration(
                color: Color(0xffEBF7FC),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(11),
                    bottomLeft: Radius.circular(11))),*/
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap:widget.transferRequestsDetails == null ? null
                        : widget.transferRequestsDetails!.transfer_printout == null
                      ? null :(){

                  /*    customAnimatedPushNavigation(context, XPrinterScreen(
                        pdfUrl:  widget.transferRequestsDetails!.transfer_printout!,
                      ));*/

                      Dialogs.printPdf(url:  widget.transferRequestsDetails!.transfer_printout!,
                          context: context);

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      height: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.038
                          : MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          color: widget.transferRequestsDetails!.transfer_printout == null ? kGreyColor : Color(0xff1D7AFC),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: Text(
                              "print_invoice".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.006,
                          ),
                          Image.asset(
                              'assets/images/PrinterMinimalistic.png'),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                     Text(
                          "total".tr(),
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),

                    Text(
                          ' ${filteredProducts.fold<double>(0.0, (sum, transfer) =>
                          sum + (transfer.productPrice ?? 0.0)).toInt()} ${"sar".tr()}  ',
                          style: TextStyle(
                            color: Color(0xff0056C9),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.003,
          ),
        ],
      ),
    );
  }
  
}