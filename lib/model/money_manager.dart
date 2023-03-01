class ManagerMoney {
  final String typepayment;
  final String kindpayment;
  final String namepayment;
  final String numberpayment;
  final String contentmoney;
  final String date;

  const ManagerMoney({
    required this.typepayment,
    required this.kindpayment,
    required this.namepayment,
    required this.numberpayment,
    required this.contentmoney,
    required this.date,
  });

  factory ManagerMoney.fromMap(Map<dynamic, dynamic> map) {
    return ManagerMoney(
        typepayment: map['typepayment'],
        namepayment: map['namepayment'],
        kindpayment: map['kindpayment'],
        numberpayment: map['numbermoney'],
        contentmoney: map['contentmoney'],
        date: map['date']);
  }
}
