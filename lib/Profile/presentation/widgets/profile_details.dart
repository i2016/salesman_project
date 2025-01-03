import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails(
      {super.key,
      required this.gender,
      required this.name,
      required this.cardNumber,
      required this.employerNumber,
      required this.email,
      required this.phone,
      required this.employment,
      required this.employerDate});

  final String gender;
  final String name;
  final String cardNumber;
  final String employerNumber;
  final String email;
  final String phone;
  final String employment;
  final String employerDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.017),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "gender".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      gender,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "name".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "id_number".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      cardNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "employee_number".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      employerNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "email".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "phone_number".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      employerNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "job".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      employment,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Opacity(
                      opacity: 0.7,
                      child: Text(
                        "employee_since".tr(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff25292E)),
                      ),
                    ),
                    Text(
                      employerDate,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
