class FactorData {
  String barcode;
  String quantity;
  String productName;
  String total;
  String time;
  String date;
  String dayOfWeek;
  String customerName;
  String factorNumber;
  String sellerName;

  FactorData({
    required this.barcode,
    required this.quantity,
    required this.productName,
    required this.total,
    required this.time,
    required this.date,
    required this.dayOfWeek,
    required this.customerName,
    required this.factorNumber,
    required this.sellerName,
  });

  // Convert FactorData instance to List<String>
  List<String> toList() {
    return [
      barcode,
      quantity,
      productName,
      total,
      time,
      date,
      dayOfWeek,
      customerName,
      factorNumber,
      sellerName,
    ];
  }
}
