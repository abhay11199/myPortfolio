import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:my_portfolio/model/investment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvestmentProvider with ChangeNotifier {
  List<InvestmentModel> _investments = [];

  List<InvestmentModel> get investments => _investments;

  InvestmentProvider() {
    loadInvestments();
  }

  Future<void> loadInvestments() async {
    final prefs = await SharedPreferences.getInstance();
    final String? investmentsString = prefs.getString('investments');
    if (investmentsString != null) {
      final List<dynamic> jsonData = json.decode(investmentsString);
      _investments = jsonData
          .map((data) => InvestmentModel(
                name: data['name'],
                amountInvested: data['amountInvested'],
                currentValue: data['currentValue'],
              ))
          .toList();
      notifyListeners();
    }
  }

  Future<void> addInvestment(InvestmentModel investment) async {
    _investments.add(investment);
    await saveInvestments();
    notifyListeners();
  }

  Future<void> saveInvestments() async {
    final prefs = await SharedPreferences.getInstance();
    final String investmentsString = json.encode(
      _investments
          .map((inv) => {
                'name': inv.name,
                'amountInvested': inv.amountInvested,
                'currentValue': inv.currentValue,
              })
          .toList(),
    );
    prefs.setString('investments', investmentsString);
  }

  double get totalPortfolioValue {
    return _investments.fold(0, (sum, inv) => sum + inv.currentValue);
  }
}
