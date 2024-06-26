import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/BankingModel.dart';
import '../const/BankingColors.dart';
import '../const/BankingContants.dart';
import '../utils/BankingDataGenerator.dart';
import '../const/BankingStrings.dart';
import 'BankingPaymentDetails.dart';

class BankingPayment extends StatefulWidget {
  static var tag = "/BankingPayment";

  @override
  _BankingPaymentState createState() => _BankingPaymentState();
}

class _BankingPaymentState extends State<BankingPayment> {
  late List<BankingPaymentModel> mList;

  @override
  void initState() {
    super.initState();
    mList = bankingPaymentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              10.height,
              Text(
                Banking_lbl_Payment,
                style: boldTextStyle(color:  Banking_TextColorPrimary, size: 32),
              ),
              8.height,
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Payment",
                  labelStyle: primaryTextStyle(size: textSizeLargeMedium.toInt(), color: Banking_greyColor),
                  suffixIcon: Icon(Icons.search, size: 30, color: Banking_greyColor),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Banking_greyColor)),
                ),
              ),
              20.height,
              GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 6),
                    decoration: boxDecorationWithShadow(
                      backgroundColor: context.cardColor,
                      boxShadow: defaultBoxShadow(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(mList[index].img!, height: 35, width: 35, color: mList[index].color),
                        15.height,
                        Text(
                          mList[index].title!,
                          style: primaryTextStyle(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ).onTap(
                    () {
                      BankingPaymentDetails(headerText: mList[index].title).launch(context);
                    },
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
