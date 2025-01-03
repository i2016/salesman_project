import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/widgets/review_product_screen_details.dart';

class ReviewProductScreen extends StatefulWidget{
  const ReviewProductScreen({super.key});

  @override
  State<ReviewProductScreen> createState() => _ReviewProductScreenState();
}

class _ReviewProductScreenState extends State<ReviewProductScreen> {

  @override
  void initState() {
    super.initState();
Shared.images_list = [];
Shared.orderPaymentList = [];
  }
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      menuType:  "subMenu",
      child: ReviewProductScreenDetails(),
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text:  "end_visit".tr(),
          onClick: () => Dialogs.showDialogFinishVisit(context),
        ),
      ],
    );  }
}