import './water_item_previous_invoices.dart';
import 'package:flutter/material.dart';

class SearchTextFieldInvoicesDetailsScreen extends StatelessWidget{
  const SearchTextFieldInvoicesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back),
              ),
            SizedBox(
            width: MediaQuery.of(context).size.width * 0.019,
          ),
            const Text(
              'الفاتورة رقم 123414',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.019,
          ),
          const WaterItemPreviousInvoices(
                        saleName: 'مبيعات 500 ر.س',
                        pill: 'فاتورة رقم 123414',
                        date: 'اصدار بتاريخ 21 / 8 / 2024',
                        icon: 'assets/images/marketImage.png',
                        color: Color(0xff0056C9),
                        textIcon: '50 منتج',
                        invoiceId: 1,
                      ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait ?
           MediaQuery.of(context).size.height * 0.033
           : MediaQuery.of(context).size.height * 0.054,
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
                  color: Color.fromARGB(255, 146, 155, 171),
                )
              ),
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'تصفية حسب',
                style: TextStyle(
                  color: Color(0xff758195),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  ),
              ),
               Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: MediaQuery.of(context).orientation == Orientation.portrait ?
           MediaQuery.of(context).size.height * 0.033
           : MediaQuery.of(context).size.height * 0.054,
          decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5 , horizontal: 11),
            child: Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: Text(
                    'الصنف',
                    style: TextStyle(
                      color: Color(0xff758195),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){},
                    child: const Icon(Icons.keyboard_arrow_down))
                ),
              ],
            ),
            ),
               ),
            ],
          ),
        ),
      ],
    );
  }
}