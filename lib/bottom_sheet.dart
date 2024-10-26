import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_config.dart';
import 'package:my_portfolio/constants/colors.dart';

class AddTodoBttomSheet extends StatefulWidget {
  final bool forEdit;
  const AddTodoBttomSheet({required this.forEdit, super.key});

  @override
  State<AddTodoBttomSheet> createState() => _AddTodoBttomSheetState();
}

class _AddTodoBttomSheetState extends State<AddTodoBttomSheet> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
          height: appConfig.deviceHeight(55),
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
                              return 'Please enter a title';
                            }
                            return null;
                          },
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
                              return 'Please enter a description';
                            }
                            return null;
                          },
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
                              return 'Please enter a description';
                            }
                            return null;
                          },
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
                              FocusScope.of(context).unfocus();
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
                            onPressed: () {},
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
