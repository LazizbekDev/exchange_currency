class CurrencyModel {
  final String id;
  final String ccy;
  final String rate;
  const CurrencyModel(
      {required this.id,
      required this.ccy,
      required this.rate,
    });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['id'].toString(),
      ccy: json['Ccy'] as String,
      rate: json['Rate'] as String,
    );
  }
}
