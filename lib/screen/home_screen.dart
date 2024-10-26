import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/bottom_sheet.dart';
import 'package:my_portfolio/constants/app_config.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/screen/investment_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: appConfig.deviceWidth(5),
              ),
              child: Container(
                  height: appConfig.deviceHeight(7),
                  width: appConfig.deviceWidth(70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.whitecolor,
                      border: Border.all(color: AppColors.blackColor)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: appConfig.deviceWidth(5),
                        top: appConfig.deviceWidth(3)),
                    child: Text(
                      'Total:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appConfig.textSizeScale(20),
                      ),
                    ),
                  )),
            ),
            FloatingActionButton(
              hoverColor: AppColors.greencolor,
              foregroundColor: AppColors.redColor,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const AddTodoBttomSheet(
                      forEdit: false,
                    );
                  },
                );
              },
              backgroundColor: AppColors.blackColor,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: AppColors.lightbluecolor,
          title: Text(
            'My PortFolio',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whitecolor,
                fontSize: appConfig.textSizeScale(18)),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(appConfig.rWP(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: appConfig.rWP(60)),
                child: Text(
                  'Investments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: appConfig.textSizeScale(20),
                  ),
                ),
              ),
              SizedBox(
                height: appConfig.deviceHeight(2),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(top: appConfig.rHP(1)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InvestmentDetailScreen()));
                        },
                        child: Container(
                          height: appConfig.deviceHeight(12),
                          width: appConfig.deviceWidth(100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.blueColor.withOpacity(0.1),
                              border: Border.all(color: AppColors.blackColor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: appConfig.rWP(2)),
                            child: Padding(
                              padding: EdgeInsets.all(appConfig.rWP(2)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Investment Name: ',
                                        style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize:
                                                appConfig.textSizeScale(15),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Invested Amount:',
                                        style: TextStyle(
                                            color: AppColors.greencolor,
                                            fontSize:
                                                appConfig.textSizeScale(10),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Current Value:',
                                        style: TextStyle(
                                            color: AppColors.greencolor,
                                            fontSize:
                                                appConfig.textSizeScale(10),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
