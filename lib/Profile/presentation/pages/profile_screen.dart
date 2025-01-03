import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/App/presentation/widgets/app_home_button_widget.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Profile/presentation/bloc/profile_bloc.dart';
import 'package:water/Profile/presentation/widgets/profile_screen_body.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Profile/presentation/pages/change_password_screen.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  /*  WidgetsBinding.instance.addPostFrameCallback((_) {
      profileBloc.add(GetProfileEvent());
    });*/
  }
  @override
  Widget build(BuildContext context) {
     return AppScreen(
       child: ProfileScreenBody(),
       screenButtons: [
         AppButtonWidget(
           asset: 'assets/images/passwordTextField.png',
           text: "password".tr(),
           onClick: () {
             customAnimatedPushNavigation(context, ChangePasswordScreen());
           },
         ),
         AppButtonWidget(
           asset: 'assets/images/LogOut.png',
           text: "logOut".tr(),
           onClick: () => Dialogs.showDialogProfileLogout(context),
           color: kWhiteColor,
         ),
       ],
     );
  }
}