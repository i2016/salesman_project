import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Profile/presentation/widgets/profile_details.dart';
import 'package:water/Profile/presentation/widgets/profile_note_container.dart';
import 'package:water/widgets/button.dart';
import 'package:water/widgets/navigate_basic_container.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
               "your_account".tr(),
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            const ProfileNoteContainer(),
             ProfileDetails(
              gender: "male".tr(),
              name: "name".tr(),
              cardNumber: '6677889900',
              employerNumber: '1122334455',
              email: 'yousuf.ali@yanabie.com',
              phone: '+966501234567',
              employment: "employment".tr(),
              employerDate: '2015 / 03 / 15',
            ),
          ],
        ),
      ),
    );
  }
}
