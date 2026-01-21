
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:water/Authentication/domain/entities/login_entity.dart';
import 'package:water/Authentication/presentation/bloc/login_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/local_const.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Dashboard/presentation/pages/dashboard_screen.dart';

class LoginScreenDetails extends StatefulWidget {
  LoginScreenDetails({super.key});

  @override
  State<LoginScreenDetails> createState() => _LoginScreenDetailsState();
}

class _LoginScreenDetailsState extends State<LoginScreenDetails> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_LoginScreenkey');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: loginBloc,
        listener: (context, state) {
          if(state is Loading){
            Shared.showLoadingDialog(context: context);
          }
          else if(state is LoginDone){
            Shared.dismissDialog(context: context);
            if (state.model!.result!.data!.type == "b2c") {
              Shared.userType = "B2C";

            } else {
              Shared.userType = "B2B";
            }
            customAnimatedPushNavigation(
              context,
              DashboardScreen(),
            );

          }
          else if(state is LoginErrorLoading){
            Shared.dismissDialog(context: context);
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: "خطا ...",
              text: state.message,
            );

          }
        },
        child:Directionality(
          textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 33, right: 11, left: 11, bottom: 14),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        klogin.tr(),
                        style: TextStyle(
                          color: Color(0xff25292E),
                          fontSize: 23,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.026,
                      ),
                      Image.asset(
                        'assets/images/GroupLogo.png',
                        height: MediaQuery.of(context).orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.035
                            : MediaQuery.of(context).size.height * 0.062,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      usernameTextField(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017,
                      ),
                      passwordTextField(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            loginBloc.add(loginClickEvent(
                                loginEntity:LoginEntity(
                                    userName:  emailController.text,
                                    password:  passwordController.text
                                )
                            ));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.32,
                          height: MediaQuery.of(context).orientation == Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.04
                              : MediaQuery.of(context).size.height * 0.068,
                          decoration: BoxDecoration(
                              color: const Color(0xff1D7AFC),
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/CheckCircle.png',
                                  color: Color(0xffF9F9F9)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.006,
                              ),
                               Opacity(
                                opacity: 0.8,
                                child: Text(
                                 ksign_in.tr(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.024,
                ),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0), // Set the radius as needed
                    child: Image.asset(
                      'assets/images/loginImage.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget usernameTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          kemail.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.003,
        ),
        Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01,
          ),
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.044
              : MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color.fromARGB(255, 215, 212, 212),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/emailTextField.png',
                  height: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.021
                      : MediaQuery.of(context).size.height * 0.05,
                ),
              ),
              Expanded(
                flex: 20,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[\u0600-\u06FFa-zA-Z0-9@._-]'), // Arabic and English characters
                    ),
                  ],
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.014,
                    ),

                    border: InputBorder.none,
                    hintText: kenter_work_email.tr(),
                    hintStyle: const TextStyle(
                      color: Color(0xff758195),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),

                  ),


                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kemail_required.tr();
                    }
                    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return kinvalid_email.tr();
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget passwordTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          kpassword.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.003,
        ),
        Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.01,
            right: MediaQuery.of(context).size.width * 0.01,
          ),
          width: double.infinity,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.044
              : MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color.fromARGB(255, 215, 212, 212),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/passwordTextField.png',
                  height: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.021
                      : MediaQuery.of(context).size.height * 0.05,
                ),
              ),
              Expanded(
                flex: 20,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
    keyboardType: TextInputType.text, // Allow both Arabic and English
    inputFormatters: [
    FilteringTextInputFormatter.allow(
      RegExp(r'[\u0600-\u06FFa-zA-Z0-9@._-]'), // Arabic and English characters
    )
    ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.014,
                    ),
                    border: InputBorder.none,
                    hintText: kenter_password.tr(),
                    hintStyle: const TextStyle(
                      color: Color(0xff758195),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kpassword_required.tr();
                    }
                    // if (value.length < 6) {
                    //   return kpassword_min_length.tr();
                    // }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
