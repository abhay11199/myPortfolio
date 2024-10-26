class InvestmentModel {
  String name;
  double amountInvested;
  double currentValue;

  InvestmentModel({
    required this.name,
    required this.amountInvested,
    required this.currentValue,
  });

  double get percentageGrowth {
    return ((currentValue - amountInvested) / amountInvested) * 100;
  }
}
