import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/BankingColors.dart';
import '../../const/BankingImages.dart';
import '../../const/BankingStrings.dart';
import '../../services/db_services.dart';
import '../../utils/BankingWidget.dart';
import '../BankingDashboard.dart';
import 'BankingForgotPassword.dart';
import 'bankingSignUp.dart';


class BankingSignIn extends StatefulWidget {
  static var tag = "/BankingSignIn";

  @override
  _BankingSignInState createState() => _BankingSignInState();
}

class _BankingSignInState extends State<BankingSignIn> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary),
      ).paddingBottom(16),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(Banking_ic_Signin, height: 250), // Example height, adjust as needed
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(Banking_lbl_SignIn, style: boldTextStyle(size: 30)),
                  16.height,
                  EditText(text: "Phone", isPassword: false,mController:phoneController ,),
                  8.height,
                  EditText(text: "Password", isPassword: true, isSecure: true,mController: passwordController,),
                  16.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(Banking_lbl_Forgot, style: secondaryTextStyle(size: 16)).onTap(
                      () {
                        BankingForgotPassword().launch(context);
                      },
                    ),
                  ),
                  16.height,
                  BankingButton(
                    textContent: Banking_lbl_SignIn,
                    onPressed: _signIn,
                  ),
                  16.height,
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle:  primaryTextStyle(size: 16, color: Banking_blueColor)), onPressed: () {
                            BankingSignup().launch(context);

                          }, child: Text( Banking_lbl_Signup_now_),
                          ),
                          Text(
                            Banking_lbl_Login_with_FaceID,
                            style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary),
                          ),
                        ],
                      ),
                      16.height,
                      Image.asset(Banking_ic_face_id, color: Banking_Primary, height: 40, width: 40),
                    ],
                  ).center(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _signIn() async {
    String phone = phoneController.text;
    String password = passwordController.text;

    if (phone.isEmpty || password.isEmpty) {
      toast('Please fill in all fields');
      return;
    }

    bool isValid = await SQLHelper.checkCredentials(phone, password);
    int? userId = await SQLHelper.getUserIdByPhone(phone);

    if (isValid) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userID', userId!);
      BankingDashboard().launch(context);
    } else {
      toast('Wrong phone number or password');
    }
  }
}

