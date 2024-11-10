import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/widgets/review_returned_products_screen_details.dart';
import 'package:water/Base/common/dialogs.dart';

class ReviewReturnedProductsScreen extends StatefulWidget{
  const ReviewReturnedProductsScreen({super.key});

  @override
  State<ReviewReturnedProductsScreen> createState() => _ReviewReturnedProductsScreenState();
}

class _ReviewReturnedProductsScreenState extends State<ReviewReturnedProductsScreen> {
  @override
  void initState() {
    super.initState();
    Shared.returns_products_list = [];
  }
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: ReviewReturnedProductsScreenDetails(),
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text: 'انهاء الزيارة',
          onClick: () => Dialogs.showDialogFinishVisit(context),
        ),
      ],
     menuType:  "subMenu",
    );
  }
}