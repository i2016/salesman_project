import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Visits/presentation/pages/Today/widgets/attach_photos_screen_body.dart';

class AttachPhotosScreen extends StatelessWidget{
  const AttachPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      menuType: "subMenu",
      child: AttachPhotosScreenBody(),
      screenButtons: [
        AppButtonWidget(
          asset: 'assets/images/ChCircle.png',
          text:  "end_visit".tr(),
          onClick: () => Dialogs.showDialogFinishVisit(context),
        ),
      ],
    );
  }
}