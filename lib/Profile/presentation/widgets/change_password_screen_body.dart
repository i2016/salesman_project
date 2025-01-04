import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Profile/domain/entities/resetPassword_entity.dart';
import 'package:water/Profile/presentation/bloc/profile_bloc.dart';
import 'package:water/widgets/change_password_text_field.dart';

class ChangePasswordScreenBody extends StatelessWidget {
  ChangePasswordScreenBody({super.key});

  final TextEditingController _currentPasswordController =
  TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        body: BlocListener(
        bloc: profileBloc,
        listener: (context, state) {
      if(state is Loading){
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
        );
      }
      else if(state is RestPasswordDone){
        Shared.dismissDialog(context: context);

        Dialogs.showDialogChangePassword(context);
      }
      else if(state is RestPasswordErrorLoading){
        Shared.dismissDialog(context: context);
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "error".tr(),
          text: state.message,
        );
      }
    },
    child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, icon: const Icon(Icons.arrow_back)),
                       Text(
                        "change_password".tr(),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    ChangePasswordTextField(
                      nameTextField: "Current_Password".tr() ,
                      hintTextField: "enter_Current_Password".tr(),
                      controller: _currentPasswordController,
                    ),
                    ChangePasswordTextField(
                      nameTextField:   "new_password".tr(),
                      hintTextField: "enter_new_password".tr(),
                      controller: _newPasswordController,
                    ),
                    ChangePasswordTextField(
                      nameTextField: "confirm_password".tr(),
                      hintTextField:   "enter_confirm_password" .tr(),
                      controller: _confirmPasswordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                       onTap: () async {
                         if (_newPasswordController.text != _confirmPasswordController.text) {
                           Flushbar(
                             message:  "new_password_and_confirm_password_should_be_same".tr(),
                             duration:  Duration(seconds: 3),
                           )..show(context);
                         } else {
                           profileBloc.add(ResetPasswordClickEvent(
                               resetPasswordEntity:  ResetPasswordEntity(
                                   login: await sharedPreferenceManager.readString(CachingKey.EMAIL),
                                   newPassword: _newPasswordController.text,
                                   oldPassword: _currentPasswordController.text
                               )
                           ));
                         }

                       },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                            height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.038
                            : MediaQuery.of(context).size.height * 0.065,
                            decoration: BoxDecoration(
                            color: Color(0xff1D7AFC),
                            borderRadius: BorderRadius.circular(6)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/CheckCircle.png',
                                        color: Colors.white
                                        ),
                                        SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.006,
                                      ),
                                       Opacity(
                                        opacity: 0.7,
                                        child: Text(
                                          "save_changes".tr(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                        ),
                  ),
                      ],
                    ),
                  ],
    )   ),
              ),
    );
  }
}
