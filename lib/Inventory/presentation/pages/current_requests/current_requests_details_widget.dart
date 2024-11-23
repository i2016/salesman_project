import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/App/presentation/bloc/app_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Inventory/data/models/transfer_requests_details_model.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/search_text_field.dart';

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

    return Column(
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

                    hintText: 'البحث عن منتج',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 165, 171, 182),
                    )
                ),
              ),
            )
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.014,
        ),
        const ImageNumberProductPriceContainer(),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  appBloc.add(AppDrawrEvent(drawerType: 'editProduct'));
                  //      scaffoldKey!.currentState!.openEndDrawer();
                },
                child:  ReviewProductWaterItem(
                  addedProductEntity: AddedProductEntity(
                    id:  filteredProducts[index].productId,
                    name:   filteredProducts[index].productName,
                    selectedCount: int.parse(filteredProducts[index].quantity.toString().split('.')[0]),
                    price: filteredProducts[index].productPrice,
                    description: filteredProducts[index].productDescription,
                    image: "",
                    total: double.parse(filteredProducts[index].productPrice.toString()) * int.parse(filteredProducts[index].quantity.toString().split('.')[0])
                  ),
                ),
              );
            }),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.006,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.03
              : MediaQuery.of(context).size.height * 0.05,
          decoration: const BoxDecoration(
              color: Color(0xffEBF7FC),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(11),
                  bottomLeft: Radius.circular(11))),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    'الاجمالي',
                    style: TextStyle(
                        color: Color(0xff0056C9),
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ' ${filteredProducts.fold<double>(0.0, (sum, transfer) =>
                    sum + (transfer.productPrice ?? 0.0)).toInt()}  ر.س  ',
                    style: TextStyle(
                      color: Color(0xff0056C9),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.003,
        ),
      ],
    );
  }
  
}