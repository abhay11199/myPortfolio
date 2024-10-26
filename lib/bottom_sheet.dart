import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_config.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/model/investment_model.dart';
import 'package:my_portfolio/providers/investment_provider.dart';
import 'package:provider/provider.dart';

class AddInvestmentBottomSheet extends StatefulWidget {
  final bool forEdit;
  const AddInvestmentBottomSheet({required this.forEdit, super.key});

  @override
  State<AddInvestmentBottomSheet> createState() =>
      _AddInvestmentBottomSheetState();
}

class _AddInvestmentBottomSheetState extends State<AddInvestmentBottomSheet> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountInvestedController =
      TextEditingController();
  final TextEditingController currentValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
          height: appConfig.deviceHeight(65),
          color: AppColors.whitecolor,
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.all(appConfig.rWP(4)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Investment Name',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: appConfig.textSizeScale(20),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Container(
                        width: appConfig.deviceWidth(90),
                        padding: EdgeInsets.only(
                          left: appConfig.deviceWidth(3),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.greycolor,
                            borderRadius: BorderRadius.circular(6)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          controller: nameController,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: 'investment name',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: appConfig.textSizeScale(15),
                                color: AppColors.whitecolor,
                              ),
                              alignLabelWithHint: true),
                        ),
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Text(
                        'Amount Invested',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: appConfig.textSizeScale(20),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Container(
                        width: appConfig.deviceWidth(90),
                        padding: EdgeInsets.only(
                          left: appConfig.deviceWidth(3),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.greycolor,
                            borderRadius: BorderRadius.circular(6)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a amount';
                            }
                            return null;
                          },
                          controller: amountInvestedController,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'enter amount',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: appConfig.textSizeScale(15),
                                color: AppColors.whitecolor,
                              ),
                              alignLabelWithHint: true),
                        ),
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Text(
                        'Current Value',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: appConfig.textSizeScale(20),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Container(
                        width: appConfig.deviceWidth(90),
                        padding: EdgeInsets.only(
                          left: appConfig.deviceWidth(3),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.greycolor,
                            borderRadius: BorderRadius.circular(6)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a amount';
                            }
                            return null;
                          },
                          controller: currentValueController,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'enter amount',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: appConfig.textSizeScale(15),
                                color: AppColors.whitecolor,
                              ),
                              alignLabelWithHint: true),
                        ),
                      ),
                      SizedBox(
                        height: appConfig.deviceHeight(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            color: AppColors.greencolor,
                            onPressed: () async {
                              if (nameController.text.isNotEmpty &&
                                  amountInvestedController.text.isNotEmpty &&
                                  currentValueController.text.isNotEmpty) {
                                final investment = InvestmentModel(
                                    name: nameController.text,
                                    amountInvested: double.parse(
                                        amountInvestedController.text),
                                    currentValue: double.parse(
                                        currentValueController.text));
                                Provider.of<InvestmentProvider>(context,
                                        listen: false)
                                    .addInvestment(investment);
                                Navigator.pop(context);
                              } else if (_formkey.currentState!.validate()) {}
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            height: appConfig.deviceHeight(5),
                            minWidth: appConfig.deviceWidth(30),
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: appConfig.textSizeScale(15)),
                            ),
                          ),
                          SizedBox(
                            width: appConfig.deviceWidth(5),
                          ),
                          MaterialButton(
                            color: AppColors.redColor,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            height: appConfig.deviceHeight(5),
                            minWidth: appConfig.deviceWidth(30),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                  color: AppColors.whitecolor,
                                  fontSize: appConfig.textSizeScale(15)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
