
import 'package:bankingapp/screen/Auth/BankingSignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/BankingColors.dart';
import '../../const/BankingImages.dart';
import '../../const/BankingStrings.dart';
import '../../utils/BankingWidget.dart';

class BankingSignup extends StatefulWidget {
  static var tag = "/BankingSignup";

  const BankingSignup({super.key});

  @override
  State<BankingSignup> createState() => _BankingSignupState();
}

class _BankingSignupState extends State<BankingSignup> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(

          children: [
            SvgPicture.asset(Banking_ic_Signup, height: 124),
             SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(Banking_lbl_SignIn, style: boldTextStyle(size: 30)),
                16.height,

                EditText(text: "User Name", isPassword: false),
                EditText(text: "Id  Number ", isPassword: false),
                EditText(text: "Phone", isPassword: false),
                EditText(text: "Email", isPassword: false),

                8.height,
                EditText(text: "Password", isPassword: true, isSecure: true),
                16.height,
                16.height,
                BankingButton(
                  textContent: Banking_lbl_SignIn,
                  onPressed: () {
                    BankingSignIn().launch(context);
                  },
                ),
                16.height,
            ]


              ),
        ),
    ]
        ).center()
      )
    );
  }
}
