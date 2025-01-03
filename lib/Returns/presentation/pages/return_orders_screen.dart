import 'package:flutter/material.dart';
import 'package:water/returns/presentation/pages/widgets/return_orders_screen_details.dart';

import '../../../App/presentation/pages/app_screen.dart';

class ReturnOrdersScreen extends StatelessWidget{
  const ReturnOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: ReturnOrdersScreenDetails(),
      screenButtons: [],
    );
  }
}