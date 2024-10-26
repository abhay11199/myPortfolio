import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/bottom_sheet.dart';
import 'package:my_portfolio/constants/app_config.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/providers/investment_provider.dart';
import 'package:my_portfolio/screen/investment_detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<void> loading() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);

    return FutureBuilder(
      future: loading(),
      builder: (context, data) {
        if (data.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.hasError) {
          return Center(
            child: Text('no data'),
          );
        } else {
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
                    child: Consumer<InvestmentProvider>(
                        builder: (context, value, child) {
                      return Container(
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
                              'Total: \$${value.totalPortfolioValue.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: appConfig.textSizeScale(20),
                              ),
                            ),
                          ));
                    }),
                  ),
                  FloatingActionButton(
                    hoverColor: AppColors.greencolor,
                    foregroundColor: AppColors.redColor,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const AddInvestmentBottomSheet(
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
                    FutureBuilder(
                        future: loading(),
                        builder: (context, value) {
                          if (value.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Consumer<InvestmentProvider>(
                              builder: (context, value, child) {
                                return SizedBox(
                                  height: appConfig.deviceHeight(30),
                                  child: PieChart(PieChartData(
                                      sections:
                                          value.investments.map((investment) {
                                        final percentage =
                                            (investment.currentValue /
                                                    value.totalPortfolioValue) *
                                                100;

                                        return PieChartSectionData(
                                          value: percentage,
                                          title:
                                              '${percentage.toStringAsFixed(1)}%',
                                          color: Colors.primaries[value
                                                  .investments
                                                  .indexOf(investment) %
                                              Colors.primaries.length],
                                          radius: 60,
                                          titleStyle: TextStyle(
                                            fontSize:
                                                appConfig.textSizeScale(12),
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whitecolor,
                                          ),
                                        );
                                      }).toList(),
                                      sectionsSpace: 2,
                                      centerSpaceRadius: 30)),
                                );
                              },
                            );
                          }
                        }),
                    SizedBox(
                      height: appConfig.deviceHeight(1),
                    ),
                    Consumer<InvestmentProvider>(
                      builder: (context, value, child) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: value.investments.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final investment = value.investments[index];
                              return Padding(
                                padding: EdgeInsets.only(top: appConfig.rHP(1)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InvestmentDetailScreen(
                                                    data: investment)));
                                  },
                                  child: Container(
                                    height: appConfig.deviceHeight(12),
                                    width: appConfig.deviceWidth(100),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: AppColors.blueColor
                                            .withOpacity(0.1),
                                        border: Border.all(
                                            color: AppColors.blackColor)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: appConfig.rWP(2)),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(appConfig.rWP(2)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Investment Name: ${investment.name} ',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: appConfig
                                                          .textSizeScale(15),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Invested Amount: \$${investment.amountInvested}',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.greencolor,
                                                      fontSize: appConfig
                                                          .textSizeScale(10),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Current Value: \$${investment.currentValue}',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.greencolor,
                                                      fontSize: appConfig
                                                          .textSizeScale(10),
                                                      fontWeight:
                                                          FontWeight.bold),
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
