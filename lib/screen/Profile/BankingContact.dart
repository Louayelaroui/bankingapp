import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/BankingColors.dart';
import '../../const/BankingImages.dart';
import '../../const/BankingStrings.dart';


class BankingContact extends StatefulWidget {
  static var tag = "/BankingContact";

  @override
  _BankingContactState createState() => _BankingContactState();
}

class _BankingContactState extends State<BankingContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: 30,
                    color:  Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text(Banking_lbl_Contact, style: boldTextStyle(size: 32)),
                ],
              ),
              20.height,
              Container(
                decoration: boxDecorationWithShadow(backgroundColor: context.cardColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Headquarters', style: primaryTextStyle(size: 18)),
                    20.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Pin, height: 20, width: 20, color: Banking_palColor),
                        15.width,
                        Text("Tunisia", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Call, height: 20, width: 20, color: Banking_RedColor),
                        15.width,
                        Text("+21670116216", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Website, height: 20, width: 20, color: Banking_pinkLightColor),
                        15.width,
                        Text("www.celestialwavedigital.com", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Clock, height: 20, width: 20, color: Banking_BalanceColor),
                        15.width,
                        Text("08:00 - 17:00", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                  ],
                ),
              ),
              20.height,
              Container(
                decoration: boxDecorationWithShadow(backgroundColor: context.cardColor, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Branch 1", style: primaryTextStyle(size: 18)),
                    20.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Pin, height: 20, width: 20, color: Banking_palColor),
                        15.width,
                        Text("Tunsia ,Sousse", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Call, height: 20, width: 20, color: Banking_RedColor),
                        15.width,
                        Text("+21670116216", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Website, height: 20, width: 20, color: Banking_pinkLightColor),
                        15.width,
                        Text("www.celestialwavedigital.com", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Clock, height: 20, width: 20, color: Banking_BalanceColor),
                        15.width,
                        Text("08:00 - 17:00", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
