import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/returns/presentation/pages/widgets/order_details_return_screen_body.dart';

class OrderDetailsReturnScreen extends StatelessWidget{
  const OrderDetailsReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: OrderDetailsReturnScreenBody(),
    screenButtons: [],
    );
  }
}