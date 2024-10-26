import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_config.dart';
import 'package:my_portfolio/constants/colors.dart';

class InvestmentDetailScreen extends StatefulWidget {
  const InvestmentDetailScreen({super.key});

  @override
  State<InvestmentDetailScreen> createState() => _InvestmentDetailScreenState();
}

class _InvestmentDetailScreenState extends State<InvestmentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    return Scaffold(
        backgroundColor: AppColors.whitecolor,
        appBar: AppBar(
          backgroundColor: AppColors.lightbluecolor,
          title: Text(
            'INVESTMENT DETAILS',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whitecolor,
                fontSize: appConfig.textSizeScale(18)),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(appConfig.rWP(4)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'abc',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: appConfig.textSizeScale(40),
                    ),
                  ),
                  SizedBox(
                    height: appConfig.deviceHeight(2),
                  ),
                  Text(
                    'Amount Invested:',
                    style: TextStyle(
                        fontSize: appConfig.textSizeScale(25),
                        color: AppColors.greycolor),
                  ),
                  SizedBox(
                    height: appConfig.deviceHeight(2),
                  ),
                  Text(
                    'Current Value:',
                    style: TextStyle(
                        fontSize: appConfig.textSizeScale(25),
                        color: AppColors.greycolor),
                  ),
                ])));
  }
}
