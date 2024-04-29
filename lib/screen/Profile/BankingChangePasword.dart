import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


import '../../const/BankingColors.dart';
import '../../const/BankingStrings.dart';
import '../../services/db_services.dart';
import '../../utils/BankingWidget.dart';
import 'BankingMenu.dart';

class BankingChangePassword extends StatefulWidget {
  static var tag = "/BankingChangePassword";

  @override
  _BankingChangePasswordState createState() => _BankingChangePasswordState();
}

class _BankingChangePasswordState extends State<BankingChangePassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(color: Banking_TextColorSecondary),
      ).paddingBottom(16),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.chevron_left,
                        size: 25,
                        color:  Banking_blackColor,
                      ).onTap(
                        () {
                          finish(context);
                        },
                      ),
                      20.height,
                      Text("Change\nPassword", style: boldTextStyle(size: 32)),
                    ],
                  ),
                  20.height,
                  EditText(text: "Old Password", isPassword: true, isSecure: true,mController:oldPasswordController ,),
                  16.height,
                  EditText(text: "New Password", isPassword: true, isSecure: true,mController:newPasswordController ,),
                  16.height,
                  40.height,
                  BankingButton(
                    textContent: Banking_lbl_Confirm,
                    onPressed: _changePassword,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _changePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userID');
    bool success = await SQLHelper.updatePassword(
        userId!,
        oldPasswordController.text,
        newPasswordController.text
    );

    if (success) {

      toasty(context, 'Password successfully updated');
      BankingMenu().launch(context);
    } else {
      toasty(context, 'Failed to update password. Please check your old password.');
    }
  }

}
