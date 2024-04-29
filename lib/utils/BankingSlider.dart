import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


import '../model/BankingModel.dart';
import '../const/BankingColors.dart';
import '../const/BankingContants.dart';
import 'BankingDataGenerator.dart';
import '../const/BankingImages.dart';
import '../const/BankingStrings.dart';

class BankingSliderWidget extends StatefulWidget {
  static String tag = '/BankingSlider';

  @override
  BankingSliderWidgetState createState() => BankingSliderWidgetState();
}

class BankingSliderWidgetState extends State<BankingSliderWidget> {
  var currentIndexPage = 0;
  late List<BankingCardModel> mList;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    mList = bankingCardList();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }
  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }
  void _scrollListener() {
    double itemWidth = MediaQuery.of(context).size.width * 0.7;
    int newIndex = (_controller.offset / itemWidth).round();

    if (newIndex != currentIndexPage) {
      setState(() {
        currentIndexPage = newIndex;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: mList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 8, right: 16),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: context.width() * 0.7,
                child: Stack(
                  children: [
                    Container(height: 200, width: context.width(), child:

                    Image.asset(Banking_ic_CardImage, fit: BoxFit.fill)),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.height,
                          Row(
                            children: [
                              Text(mList[currentIndexPage].name.validate(), style: primaryTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)).expand(),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(mList[currentIndexPage].bank.validate(), style: primaryTextStyle(color: Banking_whitePureColor, size: 10, fontFamily: fontMedium)),
                              )
                            ],
                          ),
                          24.height,

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text('1121 *** ** *** 5555', style: primaryTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)),
                          ),
                          16.height,
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0,),
                            child: Text("\$" + mList[currentIndexPage].rs.validate(), style: primaryTextStyle(color: Banking_whitePureColor, size: 18, fontFamily: fontMedium)),
                          ),
                        ],
                      ),
                    ),
                    10.height,
                  ],
                ).paddingRight(16),
              );
            },
          ),
        ),
        16.height,
        DotsIndicator(
          dotsCount: mList.length,
          position: currentIndexPage.toDouble(),
          decorator: DotsDecorator(
            size: Size.square(5.0),
            activeSize: Size.square(8.0),
            color: Banking_greyColor,
            activeColor: Banking_blackColor,
          ),
        )
      ],
    );
  }
}
